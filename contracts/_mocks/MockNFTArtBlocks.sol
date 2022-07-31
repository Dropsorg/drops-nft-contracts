// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";

contract MockNFTArtBlocks is Ownable, ERC721 {
    mapping(address => bool) whitelists;

    constructor(string memory name, string memory symbol)
        public
        ERC721(name, symbol)
    {}

    function mint(uint256 tokenId) external {
        require(whitelists[msg.sender], "Permission denied");
        super._safeMint(msg.sender, tokenId);
    }

    function addWhitelists(address[] calldata _whitelists) external onlyOwner {
        for (uint i = 0; i < _whitelists.length; i++) {
            whitelists[_whitelists[i]] = true;
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return
            "https://ipfs.io/ipfs/QmfW6DALjEct2Ak3QnoufeFxpRPwdi9aupKkuRyJTHu6WF";
    }
}
