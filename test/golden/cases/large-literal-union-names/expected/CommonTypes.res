@unboxed type statusCode = @as(100) N100 | @as(101) N101 | @as(200) N200 | @as(201) N201 | @as(400) N400 | @as(500) N500
type v100OrV101OrV200OrV201OrV400OrV500 = statusCode
@unboxed type contentfulStatusCode = @as(100) N100 | @as(101) N101 | @as(200) N200 | @as(201) N201 | @as(400) N400
type v100OrV101OrV200OrV201OrV400 = contentfulStatusCode
