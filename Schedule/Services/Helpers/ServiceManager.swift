import OpenAPIURLSession

final class ServiceManager {
    static let shared = ServiceManager()
    private init() {}

    // MARK: - Private Service Properties
    private var scheduleBetweenStationsService: ScheduleBetweenStationsService?
    private var scheduleForStationService: ScheduleForStationService?
    private var scheduleThreadService: ScheduleThreadService?
    private var nearestStationsService: NearestStationsService?
    private var nearestSettlementService: NearestSettlementService?
    private var carrierService: CarrierService?
    private var stationsListService: StationsListService?
    private var copyrightService: CopyrightService?
    
    private var client: Client? {
        NetworkManager.shared?.client
    }
    
    // MARK: - Schedule Between Stations
    func getScheduleBetweenStations(from: String, to: String) async throws -> ScheduleBetweenStations {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if scheduleBetweenStationsService == nil {
            scheduleBetweenStationsService = ScheduleBetweenStationsService(client: client)
        }
        
        guard let service = scheduleBetweenStationsService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getScheduleBetweenStations(from: from, to: to)
    }
    
    // MARK: - Schedule for Station
    func getScheduleForStation(station: String) async throws -> ScheduleForStation {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if scheduleForStationService == nil {
            scheduleForStationService = ScheduleForStationService(client: client)
        }
        
        guard let service = scheduleForStationService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getScheduleForStation(station)
    }
    
    // MARK: - Schedule Thread
    func getScheduleThread(uid: String) async throws -> ScheduleThread {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if scheduleThreadService == nil {
            scheduleThreadService = ScheduleThreadService(client: client)
        }
        
        guard let service = scheduleThreadService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getThread(uid: uid)
    }
    
    // MARK: - Nearest Stations
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if nearestStationsService == nil {
            nearestStationsService = NearestStationsService(client: client)
        }
        
        guard let service = nearestStationsService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getNearestStations(lat: lat, lng: lng, distance: distance)
    }
    
    // MARK: - Nearest Settlement
    func getNearestSettlement(lat: Double, lng: Double, distance: Int) async throws -> NearestSettlement {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if nearestSettlementService == nil {
            nearestSettlementService = NearestSettlementService(client: client)
        }
        
        guard let service = nearestSettlementService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getNearestSettlement(lat: lat, lng: lng, distance: distance)
    }
    
    // MARK: - Carrier
    func getCarrier(code: String) async throws -> ThreadCarrier {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if carrierService == nil {
            carrierService = CarrierService(client: client)
        }
        
        guard let service = carrierService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getCarrier(code: code)
    }
    
    // MARK: - Stations List
    func getStationsList() async throws -> StationsList {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if stationsListService == nil {
            stationsListService = StationsListService(client: client)
        }
        
        guard let service = stationsListService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getStationsList()
    }
    
    // MARK: - Copyright
    func getCopyright() async throws -> Copyright {
        guard let client = client else { throw NetworkError.clientUnavailable }
        
        if copyrightService == nil {
            copyrightService = CopyrightService(client: client)
        }
        
        guard let service = copyrightService else {
            throw NetworkError.serviceInitializationFailed
        }
        
        return try await service.getCopyright()
    }
}

// MARK: - Error Handling
enum NetworkError: Error {
    case clientUnavailable
    case serviceInitializationFailed
}
