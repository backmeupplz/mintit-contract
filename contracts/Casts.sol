// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Casts is ERC721, Ownable {
  string public baseURI;

  constructor(
    string memory tokenName,
    string memory tokenSymbol,
    string memory _newBaseURI
  ) ERC721(tokenName, tokenSymbol) {
    baseURI = _newBaseURI;
  }

  function _baseURI() internal view override returns (string memory) {
    return baseURI;
  }

  function mint(uint256 tokenId, address to) external {
    _safeMint(to, tokenId);
  }

  function setBaseURI(string memory _newBaseURI) external onlyOwner {
    baseURI = _newBaseURI;
  }
}
