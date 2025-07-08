// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {
    struct Product {
        string name;
        string manufacturer;
        uint256 timestamp;
        string metadata;
    }

    mapping(string => Product) public products;

    function registerProduct(
        string memory _id,
        string memory _name,
        string memory _manufacturer,
        string memory _metadata
    ) public {
        require(products[_id].timestamp == 0, "Product already registered");
        products[_id] = Product(_name, _manufacturer, block.timestamp, _metadata);
    }

    function getProduct(string memory _id) public view returns (
        string memory name,
        string memory manufacturer,
        uint256 timestamp,
        string memory metadata
    ) {
        Product memory p = products[_id];
        return (p.name, p.manufacturer, p.timestamp, p.metadata);
    }
}
