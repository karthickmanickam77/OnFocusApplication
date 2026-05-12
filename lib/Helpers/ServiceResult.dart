import 'package:cookbook/Helpers/Utilities/Utilities.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';

class ServiceResult<T> {
  final ServiceStatusCode statusCode;
  final String? message;
  final T? content;
  ServiceResult(
      {required this.statusCode, this.message, required this.content});
}

ServiceStatusCode resolveStatusCode(int statusCode) {
  try {
    return ServiceStatusCode.values
        .firstWhere((e) => StatusCode[e] == statusCode);
  } catch (error) {
    error.writeExceptionData();
    return ServiceStatusCode.SystemException;
  }
}

extension ServiceResultExtension on Response {
  ServiceResult<T> getAPIServiceResult<T>(Response response) {
    try {
      var message, content;
      try {
        content = JsonMapper.deserialize<T>(response.data);
        try {
          message = content["message"];
        } catch (exception) {
          message = "";
        }
      } catch (error) {
        error.writeExceptionData();
        return ServiceResult(
            statusCode: resolveStatusCode(response.statusCode!),
            content: content,
            message: error.toString());
      }
      return ServiceResult(
          statusCode: resolveStatusCode(response.statusCode!),
          content: content,
          message: message);
    } catch (error) {
      error.writeExceptionData();

      return ServiceResult(
          statusCode: resolveStatusCode(response.statusCode!),
          content: null,
          message: error.toString());
    }
  }

  ServiceResult<List<T>> getAPIServiceResultForList<T>(Response response) {
    try {
      var message, content;
      try {
        List<T> deserializeResult = [];
        for (var item in response.data) {
          deserializeResult.add(JsonMapper.deserialize<T>(item) as T);
        }
        content = deserializeResult;
        try {
          message = response.data['message'];
        } catch (excception) {
          message = "";
        }
      } catch (error) {
        error.writeExceptionData();
        return ServiceResult(
            statusCode: resolveStatusCode(response.statusCode!),
            content: content,
            message: error.toString());
      }
      return ServiceResult(
          statusCode: resolveStatusCode(response.statusCode!),
          content: content,
          message: message);
    } catch (ex) {
      ex.writeExceptionData();
      return ServiceResult(
          statusCode: resolveStatusCode(response.statusCode!),
          content: null,
          message: ex.toString());
    }
  }
}

enum ServiceStatusCode {
  /// The server has received the request headers and the client should proceed to send the request body.
  Continue,

  /// The server is switching protocols as requested by the client.
  SwitchingProtocols,

  /// The server is processing the request but no response is available yet.
  Processing,

  /// The server is likely to send a final response with the headers included in the informational response.
  EarlyHints,

  /// The request has succeeded.
  OK,

  /// The request has been fulfilled and a new resource has been created.
  Created,

  /// The request has been accepted for processing, but the processing has not been completed.
  Accepted,

  /// The returned meta-information is not the definitive set available from the origin server.
  NonAuthoritativeInformation,

  /// The server has fulfilled the request but does not need to return a response body.
  NoContent,

  /// The server has fulfilled the request and the user agent should reset the document view.
  ResetContent,

  /// The server has fulfilled the partial GET request for the resource.
  PartialContent,

  /// The message body that follows is an XML message and can contain a number of separate response codes.
  MultiStatus,

  /// The members of a DAV binding have already been enumerated in a previous reply to this request.
  AlreadyReported,

  /// The server has fulfilled a GET request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.
  IMUsed,

  /// The requested resource corresponds to any one of a set of representations.
  MultipleChoices,

  /// The requested resource corresponds to any one of a set of representations.
  Ambiguous,

  /// The requested resource has been assigned a new permanent URI.
  MovedPermanently,

  /// The requested resource has been assigned a new permanent URI.
  Moved,

  /// The requested resource resides temporarily under a different URI.
  Found,

  /// The requested resource resides temporarily under a different URI.
  Redirect,

  /// The response to the request can be found under a different URI.
  SeeOther,

  /// The requested resource must be accessed through the proxy given by the Location field.
  UseProxy,

  /// This status code is no longer used and is reserved for future use.
  Unused,

  /// The requested resource resides temporarily under a different URI.
  TemporarRedirect,

  /// The requested resource resides temporarily under a different URI.
  RedirectKeepVerb,

  /// The server cannot or will not process the request due to an apparent client error.
  BadRequest,

  /// The request requires user authentication.
  Unauthorized,

  /// Reserved for future use. The original intention was that this code might be used as part of some form of digital cash or micropayment scheme.
  PaymentRequired,

  /// The server understood the request but refuses to authorize it.
  Forbidden,

  /// The requested resource could not be found.
  NotFound,

  /// The method specified in the request is not allowed for the resource identified by the request URI.
  MethodNotAllowed,

  /// The resource identified by the request is only capable of generating response entities which have content characteristics not acceptable according to the accept headers sent in the request.
  NotAcceptable,

  /// The client must first authenticate itself with the proxy.
  ProxyAuthenticationRequired,

  /// The server timed out waiting for the request.
  RequestTimeout,

  /// The request could not be completed due to a conflict with the current state of the resource.
  Conflict,

  /// The requested resource is no longer available at the server and no forwarding address is known.
  Gone,

  /// The server refuses to accept the request without a defined Content-Length.
  LengthRequired,

  /// The precondition given in one or more of the request-header fields evaluated to false when it was tested on the server.
  PreconditionFailed,

  /// The server is refusing to process a request because the request entity is larger than the server is willing or able to process.
  RequestEntityTooLarge,

  /// The server is refusing to service the request because the Request-URI is longer than the server is willing to interpret.
  RequestUriTooLong,

  /// The server is refusing to service the request because the entity of the request is in a format not supported by the requested resource for the requested method.
  UnsupportedMediaType,

  /// The server cannot serve the requested byte range.
  RequestedRangeNotSatisfiable,

  /// The server cannot meet the requirements of the Expect request-header field.
  ExpectationFailed,

  /// The request was directed at a server that is not able to produce a response.
  MisdirectedRequest,

  /// The server understands the content type of the request entity but was unable to process the contained instructions.
  UnprocessableEntity,

  /// The source or destination resource of a method is locked.
  Locked,

  /// The method could not be performed on the resource because the requested action depended on another action and that action failed.
  FailedDependency,

  /// The client should switch to a different protocol.
  UpgradeRequired,

  /// The origin server requires the request to be conditional.
  PreconditionRequired,

  /// The user has sent too many requests in a given amount of time.
  TooManyRequests,

  /// The server is unwilling to process the request because its header fields are too large.
  RequestHeaderFieldsTooLarge,

  /// The server is denying access to the resource as a consequence of a legal demand.
  UnavailableForLegalReasons,

  /// The server encountered an unexpected condition that prevented it from fulfilling the request.
  InternalServerError,

  /// The server does not support the functionality required to fulfill the request.
  NotImplemented,

  /// The server, while acting as a gateway or proxy, received an invalid response from the upstream server it accessed in attempting to fulfill the request.
  BadGateway,

  /// The server is currently unable to handle the request due to a temporary overloading or maintenance of the server.
  ServiceUnavailable,

  /// The server, while acting as a gateway or proxy, did not receive a timely response from the upstream server.
  GatewayTimeout,

  /// The server does not support, or refuses to support, the HTTP protocol version that was used in the request message.
  HttpVersionNotSupported,

  /// The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process.
  VariantAlsoNegotiates,

  /// The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request.
  InsufficientStorage,

  /// The server detected an infinite loop while processing the request.
  LoopDetected,

  /// Further extensions to the request are required for the server to fulfill it.
  NotExtended,

  /// The client needs to authenticate to gain network access.
  NetworkAuthenticationRequired,

  /// A network-related error occurred while processing the request.
  NetworkFailure,

  /// The response to the request can be found under a different URI.
  RedirectMethod,

  /// The resource has not been modified since the version specified by the request headers.
  NotModified,

  /// An unexpected system exception occurred while processing the request.
  ServiceException,
  SystemException,
  PermanentRedirect
}

final StatusCode = {
  ServiceStatusCode.Continue: 100,
  ServiceStatusCode.SwitchingProtocols: 10,
  ServiceStatusCode.Processing: 102,
  ServiceStatusCode.EarlyHints: 103,
  ServiceStatusCode.OK: 200,
  ServiceStatusCode.Created: 201,
  ServiceStatusCode.Accepted: 202,
  ServiceStatusCode.NonAuthoritativeInformation: 203,
  ServiceStatusCode.NoContent: 204,
  ServiceStatusCode.ResetContent: 205,
  ServiceStatusCode.PartialContent: 206,
  ServiceStatusCode.MultiStatus: 207,
  ServiceStatusCode.AlreadyReported: 208,
  ServiceStatusCode.IMUsed: 226,
  ServiceStatusCode.MultipleChoices: 300,
  ServiceStatusCode.Ambiguous: 300,
  ServiceStatusCode.MovedPermanently: 301,
  ServiceStatusCode.Moved: 301,
  ServiceStatusCode.Found: 302,
  ServiceStatusCode.Redirect: 302,
  ServiceStatusCode.SeeOther: 303,
  ServiceStatusCode.RedirectMethod: 303,
  ServiceStatusCode.NotModified: 304,
  ServiceStatusCode.UseProxy: 305,
  ServiceStatusCode.Unused: 306,
  ServiceStatusCode.TemporarRedirect: 307,
  ServiceStatusCode.RedirectKeepVerb: 307,
  ServiceStatusCode.PermanentRedirect: 308,
  ServiceStatusCode.BadRequest: 400,
  ServiceStatusCode.Unauthorized: 401,
  ServiceStatusCode.PaymentRequired: 402,
  ServiceStatusCode.Forbidden: 403,
  ServiceStatusCode.NotFound: 404,
  ServiceStatusCode.MethodNotAllowed: 405,
  ServiceStatusCode.NotAcceptable: 406,
  ServiceStatusCode.ProxyAuthenticationRequired: 407,
  ServiceStatusCode.RequestTimeout: 408,
  ServiceStatusCode.Conflict: 409,
  ServiceStatusCode.Gone: 410,
  ServiceStatusCode.LengthRequired: 411,
  ServiceStatusCode.PreconditionFailed: 412,
  ServiceStatusCode.RequestEntityTooLarge: 413,
  ServiceStatusCode.RequestUriTooLong: 414,
  ServiceStatusCode.UnsupportedMediaType: 415,
  ServiceStatusCode.RequestedRangeNotSatisfiable: 416,
  ServiceStatusCode.ExpectationFailed: 417,
  ServiceStatusCode.MisdirectedRequest: 421,
  ServiceStatusCode.UnprocessableEntity: 422,
  ServiceStatusCode.Locked: 423,
  ServiceStatusCode.FailedDependency: 424,
  ServiceStatusCode.UpgradeRequired: 426,
  ServiceStatusCode.PreconditionRequired: 428,
  ServiceStatusCode.TooManyRequests: 429,
  ServiceStatusCode.RequestHeaderFieldsTooLarge: 431,
  ServiceStatusCode.UnavailableForLegalReasons: 451,
  ServiceStatusCode.InternalServerError: 500,
  ServiceStatusCode.NotImplemented: 501,
  ServiceStatusCode.BadGateway: 502,
  ServiceStatusCode.ServiceUnavailable: 503,
  ServiceStatusCode.GatewayTimeout: 504,
  ServiceStatusCode.HttpVersionNotSupported: 505,
  ServiceStatusCode.VariantAlsoNegotiates: 506,
  ServiceStatusCode.InsufficientStorage: 507,
  ServiceStatusCode.LoopDetected: 508,
  ServiceStatusCode.NotExtended: 510,
  ServiceStatusCode.NetworkAuthenticationRequired: 0x1FF,
  ServiceStatusCode.NetworkFailure: 500,
  ServiceStatusCode.SystemException: 999
};
