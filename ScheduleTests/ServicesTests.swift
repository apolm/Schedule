import XCTest
@testable import Schedule

final class ServiceTests: XCTestCase {
    
    // MARK: - Schedule Between Stations Test
    func testScheduleBetweenStations() async throws {
        do {
            let response = try await ServiceManager.shared.getScheduleBetweenStations(from: "c146", to: "c213")
            XCTAssertNotNil(response.segments)
            XCTAssertTrue(response.segments?.count ?? 0 > 0, "No segments found")
            print("Test Success: Loaded schedule between stations (\(response.segments?.count ?? 0) segments).")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Schedule For Station Test
    func testScheduleForStation() async throws {
        do {
            let response = try await ServiceManager.shared.getScheduleForStation(station: "s9600213")
            XCTAssertNotNil(response.station?.title)
            XCTAssertFalse(response.station?.title?.isEmpty ?? true,  "Station title is empty")
            print("Test Success: Loaded schedule for station (\(response.station?.title ?? ""))")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Schedule Thread Test
    func testScheduleThread() async throws {
        do {
            let response = try await ServiceManager.shared.getScheduleThread(uid: "SU-1524_250111_c26_12")
            XCTAssertNotNil(response.title)
            XCTAssertFalse(response.title?.isEmpty ?? true, "Thread title is empty")
            print("Test Success: Loaded schedule thread (\(response.title ?? ""))")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Nearest Stations Test
    func testNearestStations() async throws {
        do {
            let response = try await ServiceManager.shared.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            XCTAssertNotNil(response.stations)
            XCTAssertTrue(response.stations?.count ?? 0 > 0, "No stations found")
            print("Test Success: Loaded nearest stations (\(response.stations?.count ?? 0))")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Nearest Settlement Test
    func testNearestSettlement() async throws {
        do {
            let response = try await ServiceManager.shared.getNearestSettlement(lat: 55.751244, lng: 37.618423, distance: 20)
            XCTAssertNotNil(response.title)
            XCTAssertFalse(response.title?.isEmpty ?? true, "Settlement title is empty")
            print("Test Success: Loaded nearest settlement (\(response.title ?? "Unknown"))")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Carrier Test
    func testCarrier() async throws {
        do {
            let response = try await ServiceManager.shared.getCarrier(code: "26")
            XCTAssertNotNil(response.title)
            XCTAssertFalse(response.title?.isEmpty ?? true, "Carrier title is empty")
            print("Test Success: Loaded carrier (\(response.title ?? "Unknown"))")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Stations List Test
    func testStationsList() async throws {
        do {
            let response = try await ServiceManager.shared.getStationsList()
            XCTAssertNotNil(response.countries)
            XCTAssertTrue(response.countries?.count ?? 0 > 0, "No countries found")
            print("Test Success: Loaded stations list (\(response.countries?.count ?? 0) countries).")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Copyright Test
    func testCopyright() async throws {
        do {
            let response = try await ServiceManager.shared.getCopyright()
            XCTAssertNotNil(response.text)
            XCTAssertFalse(response.text?.isEmpty ?? true, "Copyright text is empty")
            print("Test Success: Loaded copyright info (\(response.text ?? "Unknown"))")
        } catch {
            XCTFail("Test Failed: \(error.localizedDescription)")
        }
    }
}

