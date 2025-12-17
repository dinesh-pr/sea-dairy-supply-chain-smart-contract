// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract practice {
    address public owner;
    mapping(address => bool) public dairyFarmLIST;
    mapping(address => bool) public collectionCenterLIST;
    mapping(address => bool) public processingUnitLIST;
    mapping(address => bool) public transporterLIST;
    mapping(address => bool) public distributorLIST;
    mapping(address => bool) public retailerLIST;

    uint256 public dairyFarmCount;
    uint256 public collectionCenterCount;
    uint256 public processingUnitCount;
    uint256 public transportationCount;
    uint256 public distributionCount;
    uint256 public retailerCount;

    constructor() {
        owner = msg.sender;
    } 

    modifier restricted() {
        require(msg.sender == owner, "Sorry! You are not applicable.");
        _;
    }
    // for dairyFarm register
    struct dairy {
        address dairyFarmAddress;
        string name;
        string place;
    }

    dairy[] public dairyFarm;

    function registerDairy(
        address dairyFarmAdd,
        string memory name,
        string memory place
    ) public restricted {
        require(!dairyFarmLIST[dairyFarmAdd], "User already exists.");
        dairy memory newDairy = dairy({
            dairyFarmAddress: dairyFarmAdd,
            name: name,
            place: place
        });

        dairyFarm.push(newDairy);
        dairyFarmLIST[dairyFarmAdd] = true;
        dairyFarmCount++;
    }

    // for collcetion center register
    struct collection {
        address collectionAddress;
        string name;
        string place;
    }

    collection[] public collectionCenter;

    function registerCollection(
        address collectionAdd,
        string memory name,
        string memory place
    ) public restricted {
        require(!collectionCenterLIST[collectionAdd], "User already exists.");
        collection memory newCollection = collection({
            collectionAddress: collectionAdd,
            name: name,
            place: place
        });
        collectionCenterLIST[collectionAdd] = true;
        collectionCenter.push(newCollection);
        collectionCenterCount++;
    }

    // for processing unit
    struct packing {
        address packingAddress;
        string name;
        string place;
    }

    packing[] public packingAndProcessing;

    function registerPacking(
        address packingAdd,
        string memory name,
        string memory place
    ) public restricted {
        require(!processingUnitLIST[packingAdd], "User already exists.");
        packing memory newPack = packing({
            packingAddress: packingAdd,
            name: name,
            place: place
        });
        processingUnitLIST[packingAdd] = true;
        packingAndProcessing.push(newPack);
        processingUnitCount++;
    }

    // for transportation
    struct transporter {
        address transporterAddress;
        string name;
        string place;
    }

    transporter[] public transportation;

    function registerTransportation(
        address transporterAdd,
        string memory name,
        string memory place
    ) public restricted {
        require(!transporterLIST[transporterAdd], "User already exists.");
        transporter memory newTransport = transporter({
            transporterAddress: transporterAdd,
            name: name,
            place: place
        });
        transporterLIST[transporterAdd] = true;
        transportation.push(newTransport);
        transportationCount++;
    }

    // for distributors

    struct distributor {
        address distributorAddress;
        string name;
        string place;
    }

    distributor[] public distributors;

    function registerDistributor(
        address distributorAdd,
        string memory name,
        string memory place
    ) public restricted {
        require(!distributorLIST[distributorAdd], "User already exists.");
        distributor memory newDistributor = distributor({
            distributorAddress: distributorAdd,
            name: name,
            place: place
        });
        distributorLIST[distributorAdd] = true;
        distributors.push(newDistributor);
        distributionCount++;
    }

    // for retailers

    struct retailer {
        address retailerAddress;
        string name;
        string place;
    }

    retailer[] public retailers;

    function registerRetailer(
        address retailerAdd,
        string memory name,
        string memory place
    ) public restricted {
        require(!retailerLIST[retailerAdd], "User already exists.");
        retailer memory newRetailer = retailer({
            retailerAddress: retailerAdd,
            name: name,
            place: place
        });
        retailerLIST[retailerAdd] = true;
        retailers.push(newRetailer);
        retailerCount++;
    }

    struct order {
        uint256 quantity;
        string orderStage;
        uint256 orderStageCount;
    }

    order[] public orders;
    uint256 public orderCount;

    mapping(uint256 => uint256) trackDairyId;
    mapping(uint256 => string) trackDairyName;
    mapping(uint256 => string) trackDairyPlace;
    mapping(uint256 => uint256) trackCollectionId;
    mapping(uint256 => string) trackCollectionName;
    mapping(uint256 => string) trackCollectionPlace;
    mapping(uint256 => uint256) trackProcessingId;
    mapping(uint256 => string) trackProcessingName;
    mapping(uint256 => string) trackProcessingPlace;
    mapping(uint256 => uint256) trackTransporterId;
    mapping(uint256 => string) trackTransporterName;
    mapping(uint256 => string) trackTransporterPlace;
    mapping(uint256 => uint256) trackDistributorId;
    mapping(uint256 => string) trackDistributorName;
    mapping(uint256 => string) trackDistributorPlace;
    mapping(uint256 => uint256) trackRetailerId;
    mapping(uint256 => string) trackRetailerName;
    mapping(uint256 => string) trackRetailerPlace;

    function makeOrder(uint256 quantity) public restricted {
        order memory newOrder = order({
            quantity: quantity,
            orderStage: "Milk ordered",
            orderStageCount: 1
        });
        orders.push(newOrder);
        orderCount++;
    }

    function getTrackId(uint256 index)
        public
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return (
            trackDairyId[index],
            trackCollectionId[index],
            trackProcessingId[index],
            trackTransporterId[index],
            trackDistributorId[index],
            trackRetailerId[index]
        );
    }

    function getTrackName(uint256 index)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        return (
            trackDairyName[index],
            trackCollectionName[index],
            trackProcessingName[index],
            trackTransporterName[index],
            trackDistributorName[index],
            trackRetailerName[index]
        );
    }

    function getTrackPlace(uint256 index)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        return (
            trackDairyPlace[index],
            trackCollectionPlace[index],
            trackProcessingPlace[index],
            trackTransporterPlace[index],
            trackDistributorPlace[index],
            trackRetailerPlace[index]
        );
    }

    function markAsDairyFarm(uint256 index) public {
        require(dairyFarmLIST[msg.sender], "User is not registered.");
        require(
            keccak256(bytes(orders[index].orderStage)) ==
                keccak256("Milk ordered"),
            "Sorry! The order is not come up at this stage."
        );
        orders[index].orderStage = "At DairyFarm";
        for (uint256 i = 0; i < dairyFarmCount; i++) {
            if (dairyFarm[i].dairyFarmAddress == msg.sender) {
                trackDairyId[index] = i + 1;
                trackDairyName[index] = dairyFarm[i].name;
                trackDairyPlace[index] = dairyFarm[i].place;
            }
        }
        orders[index].orderStageCount++;
    }

    function markAsCollectionCenter(uint256 index) public {
        require(collectionCenterLIST[msg.sender], "User is not registered.");
        require(
            keccak256(bytes(orders[index].orderStage)) ==
                keccak256("At DairyFarm"),
            "Sorry! The order is not come up at this stage."
        );
        orders[index].orderStage = "At Collection Center";
        for (uint256 i = 0; i < collectionCenterCount; i++) {
            if (collectionCenter[i].collectionAddress == msg.sender) {
                trackCollectionId[index] = i + 1;
                trackCollectionName[index] = collectionCenter[i].name;
                trackCollectionPlace[index] = collectionCenter[i].place;
            }
        }
        orders[index].orderStageCount++;
    }

    function markAsProcessingUnit(uint256 index) public {
        require(processingUnitLIST[msg.sender], "User is not registered.");
        require(
            keccak256(bytes(orders[index].orderStage)) ==
                keccak256("At Collection Center"),
            "Sorry! The order is not come up at this stage."
        );
        orders[index].orderStage = "At Processing Unit";
        for (uint256 i = 0; i < processingUnitCount; i++) {
            if (packingAndProcessing[i].packingAddress == msg.sender) {
                trackProcessingId[index] = i + 1;
                trackProcessingName[index] = packingAndProcessing[i].name;
                trackProcessingPlace[index] = packingAndProcessing[i].place;
            }
        }
        orders[index].orderStageCount++;
    }

    function markAsTransporter(uint256 index) public {
        require(transporterLIST[msg.sender], "User is not registered.");
        require(
            keccak256(bytes(orders[index].orderStage)) ==
                keccak256("At Processing Unit"),
            "Sorry! The order is not come up at this stage."
        );
        orders[index].orderStage = "At Transporter";
        for (uint256 i = 0; i < transportationCount; i++) {
            if (transportation[i].transporterAddress == msg.sender) {
                trackTransporterId[index] = i + 1;
                trackTransporterName[index] = transportation[i].name;
                trackTransporterPlace[index] = transportation[i].place;
            }
        }
        orders[index].orderStageCount++;
    }

    function markAsDistributor(uint256 index) public {
        require(distributorLIST[msg.sender], "User is not registered.");
        require(
            keccak256(bytes(orders[index].orderStage)) ==
                keccak256("At Transporter"),
            "Sorry! The order is not come up at this stage."
        );
        orders[index].orderStage = "At Distributor";
        for (uint256 i = 0; i < distributionCount; i++) {
            if (distributors[i].distributorAddress == msg.sender) {
                trackDistributorId[index] = i + 1;
                trackDistributorName[index] = distributors[i].name;
                trackDistributorPlace[index] = distributors[i].place;
            }
        }
        orders[index].orderStageCount++;
    }

    function markAsRetailer(uint256 index) public {
        require(retailerLIST[msg.sender], "User is not registered.");
        require(
            keccak256(bytes(orders[index].orderStage)) ==
                keccak256("At Distributor"),
            "Sorry! The order is not come up at this stage."
        );
        orders[index].orderStage = "Order Completed";
        for (uint256 i = 0; i < retailerCount; i++) {
            if (retailers[i].retailerAddress == msg.sender) {
                trackRetailerId[index] = i + 1;
                trackRetailerName[index] = retailers[i].name;
                trackRetailerPlace[index] = retailers[i].place;
            }
        }
        orders[index].orderStageCount++;
    }

    function getOrderCount(uint256 index) public view returns (uint256) {
        return (orders[index].orderStageCount);
    }

    function getCurrentUser(address current)
        public
        view
        returns (string memory)
    {
        if (current == owner) {
            return "Owner";
        } else if (dairyFarmLIST[current]) {
            return "DairyFarm";
        } else if (collectionCenterLIST[current]) {
            return "Collection Center";
        } else if (processingUnitLIST[current]) {
            return "Processing Unit";
        } else if (transporterLIST[current]) {
            return "Transporter";
        } else if (distributorLIST[current]) {
            return "Distributor";
        } else if (retailerLIST[current]) {
            return "Retailer";
        } else {
            return "Unknown user";
        }
    }
}

