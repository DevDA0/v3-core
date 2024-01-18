// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.0;

import '../interfaces/ILSP7Minimal.sol';

/// @title TransferHelper
/// @notice Contains helper methods for interacting with ERC20 tokens that do not consistently return true/false
library TransferHelper {
    /// @notice Transfers tokens from msg.sender to a recipient
    /// @dev Calls transfer on token contract, errors with TF if transfer fails
    /// @param token The contract address of the token which will be transferred
    /// @param to The recipient of the transfer
    /// @param value The value of the transfer
    function safeTransfer(
        address token,
        address from,
        address to,
        uint256 value,
        bool force,
        bytes memory data
    ) internal {
        (bool success, ) = token.call(abi.encodeWithSelector(
            ILSP7Minimal.transfer.selector,
            from,
            to,
            value,
            force,
            data
        ));

        // Event-based check:
        require(success && emit Transfer(from, to, value, force, data), 'TF');
    }
}