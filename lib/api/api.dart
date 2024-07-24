import 'package:dio/dio.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://gdenamaz.ru/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  factory ApiClient.create({String? apiUrl}) {
    final dio = Dio();

    if (apiUrl != null) return ApiClient(dio, baseUrl: apiUrl);

    return ApiClient(dio);
  }

  @POST('users')
  Future<User> postUser(@Body() AuthRequest authRequest);

  @POST('auth/by-device')
  Future<AuthResponse> authByDevice(@Body() AuthRequest authRequest);

  @GET('auth/me')
  Future<User> authMe(@Header('X-Access-Token') String token);

  @GET('map')
  Future<List<MapPoint>> map();

  @GET('venues/{id}')
  Future<Venue> getVenue(
    @Header('X-Access-Token') token,
    @Path('id') String id,
  );

  @POST('venues')
  Future<Venue> postVenue(
    @Header('X-Access-Token') token,
    @Body() VenueRequest? venueRequest,
  );

  @POST('venues/{venueId}/approvements')
  Future<ApprovementResponse> postApprovement(
    @Header('X-Access-Token') String token,
    @Path('venueId') String venueId,
    @Body() ApprovementRequest approvementRequest,
  );

  @GET('complaint-types')
  Future<List<ComplaintType>> getComplaintTypes();

  @POST('venues/{venueId}/complaints')
  Future<ComplaintResponse> postComplaint(
    @Header('X-Access-Token') String token,
    @Path('venueId') String venueId,
    @Body() ComplaintRequest complaintRequest,
  );
}
