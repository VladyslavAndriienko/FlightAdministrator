/**
 * Class contains basic utils methods which can be reusable.
 */
public class UtilsMethods {

    /**
     * Calculate distance by Haversine formula. 
     * If @param earthRadius unit of length will be seted in meters, then the result will be in meters.
     * If @param earthRadius unit of length will be seted in kilometers, then the result will be in kilometers.
     *
     * @param latitudeOfFirstPoint latitude of first point
     * @param longitudeOfFirstPoint longitude of first point
     * @param latitudeOfSecondPoint latitude of second point
     * @param longitudeOfSecondPoint longitude of second point
     * @param earthRadius earth radius
     *
     * @return distance
     */
    public static Decimal calculateDistanceByCoordinates(
        Decimal latitudeOfFirstPoint, 
        Decimal longitudeOfFirstPoint, 
        Decimal latitudeOfSecondPoint, 
        Decimal longitudeOfSecondPoint,
        Integer earthRadius
    ) {
        // Transform coordinates from degrees to radians
        Decimal latitudeRadians1 = latitudeOfFirstPoint * Math.PI/180;
        Decimal latitudeRadians2 = latitudeOfSecondPoint * Math.PI/180;

        // Latitude and longitude differences in radians
        Decimal latitudeDelta = (latitudeOfSecondPoint - latitudeOfFirstPoint) * Math.PI/180;
        Decimal longitudeDelta = (longitudeOfSecondPoint - longitudeOfFirstPoint) * Math.PI/180;

        Decimal a = Math.sin(latitudeDelta/2) * Math.sin(latitudeDelta/2)
                    + Math.cos(latitudeRadians1) * Math.cos(latitudeRadians2)
                    * Math.sin(longitudeDelta/2) * Math.sin(longitudeDelta/2);

        Decimal arc = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

        return earthRadius * arc;
    }
}
