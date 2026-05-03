import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

enum DownloadError: Error, CustomStringConvertible {
    case invalidURL(String)
    case httpStatus(Int)
    case nonHTTPResponse

    var description: String {
        switch self {
        case .invalidURL(let s): return "URLが不正です: \(s)"
        case .httpStatus(let code): return "HTTPエラー (status \(code))"
        case .nonHTTPResponse: return "HTTP以外のレスポンスです"
        }
    }
}

struct Downloader {
    static func fetch(url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse else {
            throw DownloadError.nonHTTPResponse
        }
        guard (200..<300).contains(http.statusCode) else {
            throw DownloadError.httpStatus(http.statusCode)
        }
        return data
    }
}
