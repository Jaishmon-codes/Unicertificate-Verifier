// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
  Import OpenZeppelin Contracts
*/
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/*
  University Certificate NFT Contract
*/
contract UniCertificate is ERC721URIStorage, Ownable {

    uint256 public tokenCounter;

    /*
      Constructor
      - Sets NFT name & symbol
      - Sets deployer as Owner (University)
    */
    constructor()
        ERC721("UniversityCertificate", "UNICERT")
        Ownable(msg.sender)
    {
        tokenCounter = 0;
    }

    /*
      Issue Certificate (Mint NFT)
      Only Owner (University) can call this
    */
    function issueCertificate(
        address student,
        string memory metadataURI
    ) public onlyOwner {

        uint256 tokenId = tokenCounter;

        // Mint NFT to student
        _safeMint(student, tokenId);

        // Set metadata link (IPFS)
        _setTokenURI(tokenId, metadataURI);

        tokenCounter++;
    }

    /*
      Get total certificates issued
    */
    function totalCertificates() public view returns (uint256) {
        return tokenCounter;
    }
}
