-- FOSSY_INTLIB is a library implementing SystemC(tm) integer type
-- semantics in VHDL as functions.


--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2.1 of the License, or (at your option) any later version.
--
--  This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  Lesser General Public License for more details.
--
--  You should have received a copy of the GNU Lesser General Public
--  License along with this library; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,
--  USA.
--
--  Contact information:
--   OFFIS
--   Institute for Information Technology
--     Escherweg 2
--     D-26121 Oldenburg
--     Germany
--   www  : http://offis.de/
--   phone: +49 (441) 9722-0
--   fax  : +49 (441) 9722-102
--
--
-- Author: Claus Brunzema <Claus.Brunzema@offis.de>
--
-- Version 1.0
--
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package FOSSY_INTLIB is


-- utility functions
function FOSSY_RESIZE(ARG: UNSIGNED; NEW_SIZE: NATURAL)         return UNSIGNED;
-- Result subtype: UNSIGNED(NEW_SIZE-1 downto 0)

function FOSSY_RESIZE(ARG: SIGNED; NEW_SIZE: NATURAL)           return SIGNED;
-- Result subtype: SIGNED(NEW_SIZE-1 downto 0)

function FOSSY_RESIZE(ARG: STD_LOGIC_VECTOR; NEW_SIZE: NATURAL) return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(NEW_SIZE-1 downto 0)


function FOSSY_RANGE(X : UNSIGNED; L, R : NATURAL)         return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(L-R downto 0)

function FOSSY_RANGE(X : SIGNED; L, R : NATURAL)           return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(L-R downto 0)

function FOSSY_RANGE(X : STD_LOGIC_VECTOR; L, R : NATURAL) return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(L-R downto 0)


-- arithmetic operators ---------------------------------------------------
-- SystemC: +
function FOSSY_ADD(LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED;
-- Result subtype: UNSIGNED(MAX(LHS'LENGTH, RHS'LENGTH)+1-1 downto 0)

function FOSSY_ADD(LHS: SIGNED; RHS: SIGNED)     return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH)+1-1 downto 0)

function FOSSY_ADD(LHS: UNSIGNED; RHS: SIGNED)   return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH+1, RHS'LENGTH)+1-1 downto 0)

function FOSSY_ADD(LHS: SIGNED; RHS: UNSIGNED)   return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)+1-1 downto 0)


-- SystemC: -
function FOSSY_SUB(LHS: UNSIGNED; RHS: UNSIGNED) return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH+1, RHS'LENGTH+1)+1-1 downto 0)

function FOSSY_SUB(LHS: SIGNED; RHS: SIGNED)     return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH)+1-1 downto 0)

function FOSSY_SUB(LHS: UNSIGNED; RHS: SIGNED)   return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH+1, RHS'LENGTH)+1-1 downto 0)

function FOSSY_SUB(LHS: SIGNED; RHS: UNSIGNED)   return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)+1-1 downto 0)


-- SystemC: *
function FOSSY_MUL(LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED;
-- Result subtype: UNSIGNED(LHS'LENGTH+RHS'LENGTH-1 downto 0)

function FOSSY_MUL(LHS: SIGNED; RHS: SIGNED)     return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH+RHS'LENGTH-1 downto 0)

function FOSSY_MUL(LHS: UNSIGNED; RHS: SIGNED)   return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH+1+RHS'LENGTH-1 downto 0)

function FOSSY_MUL(LHS: SIGNED; RHS: UNSIGNED)   return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH+RHS'LENGTH+1-1 downto 0)


-- SystemC: /
function FOSSY_DIV(LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED;
-- Result subtype: UNSIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_DIV(LHS: SIGNED; RHS: SIGNED)     return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH+1-1 downto 0)

function FOSSY_DIV(LHS: UNSIGNED; RHS: SIGNED)   return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH+2-1 downto 0)

function FOSSY_DIV(LHS: SIGNED; RHS: UNSIGNED)   return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH+1-1 downto 0)

-- SystemC: %
function FOSSY_MOD(LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED;
-- Result subtype: UNSIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_MOD(LHS: SIGNED; RHS: SIGNED)     return SIGNED;
-- Result subtype: UNSIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_MOD(LHS: UNSIGNED; RHS: SIGNED)   return SIGNED;
-- Result subtype: UNSIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_MOD(LHS: SIGNED; RHS: UNSIGNED)   return SIGNED;
-- Result subtype: UNSIGNED(RHS'LENGTH+1-1 downto 0)


-- relational operators ---------------------------------------------------
-- SystemC: ==
function FOSSY_EQ(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_EQ(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_EQ(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_EQ(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_EQ(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_EQ(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_EQ(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_EQ(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_EQ(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_EQ(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_EQ(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_EQ(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_EQ(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_EQ(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_EQ(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_EQ(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;

-- SystemC: !=
function FOSSY_NEQ(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_NEQ(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_NEQ(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_NEQ(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_NEQ(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_NEQ(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_NEQ(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_NEQ(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_NEQ(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_NEQ(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_NEQ(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_NEQ(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_NEQ(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_NEQ(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_NEQ(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_NEQ(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;

-- SystemC: ||
function FOSSY_LOG_OR(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_LOG_OR(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_LOG_OR(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_LOG_OR(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_LOG_OR(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_LOG_OR(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_LOG_OR(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_LOG_OR(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_LOG_OR(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_LOG_OR(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_LOG_OR(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_LOG_OR(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_LOG_OR(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_LOG_OR(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_LOG_OR(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_LOG_OR(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;

-- SystemC: &&
function FOSSY_LOG_AND(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_LOG_AND(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_LOG_AND(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_LOG_AND(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_LOG_AND(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_LOG_AND(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_LOG_AND(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_LOG_AND(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_LOG_AND(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_LOG_AND(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_LOG_AND(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_LOG_AND(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_LOG_AND(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_LOG_AND(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_LOG_AND(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_LOG_AND(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;

-- SystemC: <
function FOSSY_LT(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_LT(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_LT(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_LT(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_LT(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_LT(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_LT(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_LT(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_LT(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_LT(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_LT(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_LT(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_LT(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_LT(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_LT(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_LT(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;

-- SystemC: <=
function FOSSY_LE(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_LE(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_LE(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_LE(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_LE(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_LE(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_LE(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_LE(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_LE(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_LE(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_LE(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_LE(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_LE(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_LE(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_LE(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_LE(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;

-- SystemC: >
function FOSSY_GT(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_GT(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_GT(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_GT(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_GT(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_GT(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_GT(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_GT(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_GT(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_GT(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_GT(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_GT(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_GT(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_GT(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_GT(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_GT(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;

-- SystemC: >=
function FOSSY_GE(LHS, RHS: UNSIGNED)                   return BOOLEAN;
function FOSSY_GE(LHS: UNSIGNED; RHS: SIGNED)           return BOOLEAN;
function FOSSY_GE(LHS: UNSIGNED; RHS: BOOLEAN)          return BOOLEAN;
function FOSSY_GE(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN;
function FOSSY_GE(LHS, RHS: SIGNED)                     return BOOLEAN;
function FOSSY_GE(LHS: SIGNED; RHS: UNSIGNED)           return BOOLEAN;
function FOSSY_GE(LHS: SIGNED; RHS: BOOLEAN)            return BOOLEAN;
function FOSSY_GE(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return BOOLEAN;
function FOSSY_GE(LHS, RHS: BOOLEAN)                    return BOOLEAN;
function FOSSY_GE(LHS: BOOLEAN; RHS: UNSIGNED)          return BOOLEAN;
function FOSSY_GE(LHS: BOOLEAN; RHS: SIGNED)            return BOOLEAN;
function FOSSY_GE(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return BOOLEAN;
function FOSSY_GE(LHS, RHS: STD_LOGIC_VECTOR)           return BOOLEAN;
function FOSSY_GE(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN;
function FOSSY_GE(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return BOOLEAN;
function FOSSY_GE(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return BOOLEAN;


-- bit operators ----------------------------------------------------------
-- SystemC: &
function FOSSY_BIT_AND(LHS, RHS: UNSIGNED)                   return UNSIGNED;
-- Result subtype: UNSIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_AND(LHS: UNSIGNED; RHS: SIGNED)           return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH+1, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_AND(LHS: UNSIGNED; RHS: BOOLEAN)          return UNSIGNED;
-- Result subtype: UNSIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_BIT_AND(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return UNSIGNED;
-- Result subtype: UNSIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_AND(LHS, RHS: SIGNED)                     return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_AND(LHS: SIGNED; RHS: UNSIGNED)           return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)-1 downto 0)

function FOSSY_BIT_AND(LHS: SIGNED; RHS: BOOLEAN)            return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_BIT_AND(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)-1 downto 0)

function FOSSY_BIT_AND(LHS, RHS: BOOLEAN)                    return BOOLEAN;
-- Result subtype: BOOLEAN

function FOSSY_BIT_AND(LHS: BOOLEAN; RHS: UNSIGNED)          return UNSIGNED;
-- Result subtype: UNSIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_AND(LHS: BOOLEAN; RHS: SIGNED)            return SIGNED;
-- Result subtype: SIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_AND(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_AND(LHS, RHS: STD_LOGIC_VECTOR)           return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_AND(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_AND(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH+1, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_AND(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(LHS'LENGTH-1 downto 0)



-- SystemC: |
function FOSSY_BIT_OR(LHS, RHS: UNSIGNED)                   return UNSIGNED;
-- Result subtype: UNSIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_OR(LHS: UNSIGNED; RHS: SIGNED)           return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH+1, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_OR(LHS: UNSIGNED; RHS: BOOLEAN)          return UNSIGNED;
-- Result subtype: UNSIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_BIT_OR(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return UNSIGNED;
-- Result subtype: UNSIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_OR(LHS, RHS: SIGNED)                     return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_OR(LHS: SIGNED; RHS: UNSIGNED)           return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)-1 downto 0)

function FOSSY_BIT_OR(LHS: SIGNED; RHS: BOOLEAN)            return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_BIT_OR(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)-1 downto 0)

function FOSSY_BIT_OR(LHS, RHS: BOOLEAN)                    return BOOLEAN;
-- Result subtype: BOOLEAN

function FOSSY_BIT_OR(LHS: BOOLEAN; RHS: UNSIGNED)          return UNSIGNED;
-- Result subtype: UNSIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_OR(LHS: BOOLEAN; RHS: SIGNED)            return SIGNED;
-- Result subtype: SIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_OR(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_OR(LHS, RHS: STD_LOGIC_VECTOR)           return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_OR(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_OR(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH+1, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_OR(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(LHS'LENGTH-1 downto 0)


-- SystemC: ^
function FOSSY_BIT_XOR(LHS, RHS: UNSIGNED)                   return UNSIGNED;
-- Result subtype: UNSIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_XOR(LHS: UNSIGNED; RHS: SIGNED)           return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH+1, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_XOR(LHS: UNSIGNED; RHS: BOOLEAN)          return UNSIGNED;
-- Result subtype: UNSIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_BIT_XOR(LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return UNSIGNED;
-- Result subtype: UNSIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_XOR(LHS, RHS: SIGNED)                     return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_XOR(LHS: SIGNED; RHS: UNSIGNED)           return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)-1 downto 0)

function FOSSY_BIT_XOR(LHS: SIGNED; RHS: BOOLEAN)            return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_BIT_XOR(LHS: SIGNED; RHS: STD_LOGIC_VECTOR)   return SIGNED;
-- Result subtype: SIGNED(MAX(LHS'LENGTH, RHS'LENGTH+1)-1 downto 0)

function FOSSY_BIT_XOR(LHS, RHS: BOOLEAN)                    return BOOLEAN;
-- Result subtype: BOOLEAN

function FOSSY_BIT_XOR(LHS: BOOLEAN; RHS: UNSIGNED)          return UNSIGNED;
-- Result subtype: UNSIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_XOR(LHS: BOOLEAN; RHS: SIGNED)            return SIGNED;
-- Result subtype: SIGNED(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_XOR(LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR)  return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(RHS'LENGTH-1 downto 0)

function FOSSY_BIT_XOR(LHS, RHS: STD_LOGIC_VECTOR)           return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_XOR(LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_XOR(LHS: STD_LOGIC_VECTOR; RHS: SIGNED)   return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(MAX(LHS'LENGTH+1, RHS'LENGTH)-1 downto 0)

function FOSSY_BIT_XOR(LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN)  return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(LHS'LENGTH-1 downto 0)


-- shift operators --------------------------------------------------------
-- SystemC: <<
function FOSSY_SHL(LHS: UNSIGNED; RHS: NATURAL; SIZE: NATURAL)         return UNSIGNED;
-- Result subtype: UNSIGNED(SIZE-1 downto 0)

function FOSSY_SHL(LHS: SIGNED; RHS: NATURAL; SIZE: NATURAL)           return SIGNED;
-- Result subtype: SIGNED(SIZE-1 downto 0)

function FOSSY_SHL(LHS: STD_LOGIC_VECTOR; RHS: NATURAL; SIZE: NATURAL) return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(SIZE-1 downto 0)


-- SystemC: >>
function FOSSY_SHR(LHS: UNSIGNED; RHS: NATURAL)         return UNSIGNED;
-- Result subtype: UNSIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_SHR(LHS: SIGNED; RHS: NATURAL)           return SIGNED;
-- Result subtype: SIGNED(LHS'LENGTH-1 downto 0)

function FOSSY_SHR(LHS: STD_LOGIC_VECTOR; RHS: NATURAL) return STD_LOGIC_VECTOR;
-- Result subtype: STD_LOGIC_VECTOR(LHS'LENGTH-1 downto 0)



-- ToDo -------------------------------------------------------------------
-- unary logical not: !
-- bit complement: ~
-- concatenation: concat()

end package FOSSY_INTLIB;





---------------------------------------------------------------------------
package body FOSSY_INTLIB is

-- Helper functions for ranges
function FIX_INDEX(ARG: SIGNED) return SIGNED is
  constant NEW_LEFT : NATURAL := (ARG'HIGH - ARG'LOW);
  variable tmp : SIGNED(NEW_LEFT downto 0);
begin
  tmp := ARG;
  return tmp;
end;

function FIX_INDEX(ARG: UNSIGNED) return UNSIGNED is
  constant NEW_LEFT : NATURAL := (ARG'HIGH - ARG'LOW);
  variable tmp : UNSIGNED(NEW_LEFT downto 0);
begin
  tmp := ARG;
  return tmp;
end;

function FIX_INDEX(ARG: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  constant NEW_LEFT : NATURAL := (ARG'HIGH - ARG'LOW);
  variable tmp : STD_LOGIC_VECTOR(NEW_LEFT downto 0);
begin
  tmp := ARG;
  return tmp;
end;



-- Conversion helper functions
function TO_STD_LOGIC_VECTOR (ARG: BOOLEAN) return STD_LOGIC_VECTOR is
  variable tmp : STD_LOGIC_VECTOR(0 downto 0);
begin
  if arg then
    tmp := "1";
  else
    tmp := "0";
  end if;
  return tmp;
end;

function TO_STD_LOGIC_VECTOR (ARG: SIGNED) return STD_LOGIC_VECTOR is
begin
  return STD_LOGIC_VECTOR(arg);
end;

function TO_STD_LOGIC_VECTOR (ARG: UNSIGNED) return STD_LOGIC_VECTOR is
begin
  return STD_LOGIC_VECTOR(arg);
end;

function TO_STD_LOGIC_VECTOR (ARG: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
begin
  return ARG;
end;


function FOSSY_TO_SIGNED(X : UNSIGNED) return SIGNED is
begin
  return FIX_INDEX(SIGNED('0' & X));
end;

function FOSSY_TO_SIGNED(X : BOOLEAN) return SIGNED is
begin
  if X then
    return TO_SIGNED(1, 2);
  else
    return TO_SIGNED(0, 2);
  end if;
end;


function FOSSY_TO_UNSIGNED(X : BOOLEAN) return UNSIGNED is
begin
  if X then
    return TO_UNSIGNED(1, 1);
  else
    return TO_UNSIGNED(0, 1);
  end if;
end;

function FOSSY_TO_UNSIGNED(X : STD_LOGIC_VECTOR) return UNSIGNED is
begin
  return UNSIGNED(X);
end;


function FOSSY_TO_BOOL(X : UNSIGNED) return BOOLEAN is
begin
  return X /= 0;
end;

function FOSSY_TO_BOOL(X : SIGNED) return BOOLEAN is
begin
  return X /= 0;
end;

function FOSSY_TO_BOOL(X : STD_LOGIC_VECTOR) return BOOLEAN is
  variable RESULT : BOOLEAN := FALSE;
begin
  for i in X'RANGE loop
    if X(i) = '1' then
      RESULT := TRUE;
    end if;
  end loop;
  return RESULT;
end FOSSY_TO_BOOL;



-- utility
function FOSSY_RESIZE (ARG: UNSIGNED; NEW_SIZE: NATURAL) return UNSIGNED is
begin
  return FOSSY_TO_UNSIGNED(FOSSY_RESIZE(TO_STD_LOGIC_VECTOR(ARG), NEW_SIZE));
end FOSSY_RESIZE;

function FOSSY_RESIZE (ARG: SIGNED; NEW_SIZE: NATURAL) return SIGNED is
  variable RESULT: SIGNED(NEW_SIZE-1 downto 0) := (others => ARG(ARG'LEFT));
begin
  if (RESULT'LENGTH < ARG'LENGTH) then
    RESULT(RESULT'LEFT downto 0) := ARG(RESULT'LEFT downto 0);
  else
    RESULT(ARG'LEFT downto 0) := ARG;
  end if;
  return RESULT;
end FOSSY_RESIZE;

function FOSSY_RESIZE (ARG: STD_LOGIC_VECTOR; NEW_SIZE: NATURAL) return STD_LOGIC_VECTOR is
  variable RESULT: STD_LOGIC_VECTOR(NEW_SIZE-1 downto 0) := (others => '0');
begin
  if (RESULT'LENGTH < ARG'LENGTH) then
    RESULT(RESULT'LEFT downto 0) := ARG(RESULT'LEFT downto 0);
  else
    RESULT(ARG'LEFT downto 0) := ARG;
  end if;
  return RESULT;
end FOSSY_RESIZE;



function FOSSY_MIN (X : NATURAL; Y : NATURAL) return NATURAL is
begin
  if X < Y
  then
    return X;
  else
    return Y;
  end if;
end FOSSY_MIN;

function FOSSY_MAX (X : NATURAL; Y : NATURAL) return NATURAL is
begin
  if X > Y
  then
    return X;
  else
    return Y;
  end if;
end FOSSY_MAX;


function FOSSY_RANGE(X : UNSIGNED; L, R : NATURAL) return STD_LOGIC_VECTOR is
begin
  return FIX_INDEX(TO_STD_LOGIC_VECTOR(X(L downto R)));
end;


function FOSSY_RANGE(X : SIGNED; L, R : NATURAL) return STD_LOGIC_VECTOR is
begin
  return FIX_INDEX(TO_STD_LOGIC_VECTOR(X(L downto R)));
end;

function FOSSY_RANGE(X : STD_LOGIC_VECTOR; L, R : NATURAL) return STD_LOGIC_VECTOR is
begin
  return FIX_INDEX(X(L downto R));
end;


-- arith add
function FOSSY_ADD (LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH) + 1;
  variable NEW_LHS : UNSIGNED(NEW_LENGTH-1 downto 0) :=
                       FOSSY_RESIZE(LHS, NEW_LENGTH);
begin
  return FIX_INDEX(NEW_LHS + RHS);
end;
function FOSSY_ADD (LHS: SIGNED; RHS: SIGNED) return SIGNED is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH) + 1;
  variable NEW_LHS : SIGNED(NEW_LENGTH-1 downto 0) :=
                       FOSSY_RESIZE(LHS, NEW_LENGTH);
begin
  return FIX_INDEX(NEW_LHS + RHS);
end;
function FOSSY_ADD (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return FOSSY_ADD(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_ADD (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return FOSSY_ADD(LHS, FOSSY_TO_SIGNED(RHS));
end;


-- sub
function FOSSY_SUB (LHS: UNSIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return FOSSY_SUB(FOSSY_TO_SIGNED(LHS), FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_SUB (LHS: SIGNED; RHS: SIGNED) return SIGNED is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH) + 1;
  variable NEW_LHS : SIGNED(NEW_LENGTH-1 downto 0) :=
                       FOSSY_RESIZE(LHS, NEW_LENGTH);
begin
  return FIX_INDEX(NEW_LHS - RHS);
end FOSSY_SUB;
function FOSSY_SUB (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return FOSSY_SUB(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_SUB (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return FOSSY_SUB(LHS, FOSSY_TO_SIGNED(RHS));
end;


-- mul
function FOSSY_MUL (LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED is
begin
  return FIX_INDEX(LHS * RHS);
end FOSSY_MUL;
function FOSSY_MUL (LHS: SIGNED; RHS: SIGNED) return SIGNED is
begin
  return FIX_INDEX(LHS * RHS);
end FOSSY_MUL;
function FOSSY_MUL (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return FOSSY_MUL(FOSSY_TO_SIGNED(LHS), RHS);
end FOSSY_MUL;
function FOSSY_MUL (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return FOSSY_MUL(LHS, FOSSY_TO_SIGNED(RHS));
end FOSSY_MUL;


-- div
function FOSSY_DIV (LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED is
begin
  return FIX_INDEX(LHS / RHS);
end FOSSY_DIV;
function FOSSY_DIV (LHS: SIGNED; RHS: SIGNED) return SIGNED is
  variable NEW_LENGTH : NATURAL := LHS'LENGTH+1;
begin
  return FIX_INDEX(FOSSY_RESIZE(LHS, NEW_LENGTH) / RHS);
end FOSSY_DIV;
function FOSSY_DIV (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return FOSSY_DIV(FOSSY_TO_SIGNED(LHS), RHS);
end FOSSY_DIV;
function FOSSY_DIV (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return FOSSY_DIV(LHS, FOSSY_TO_SIGNED(RHS));
end FOSSY_DIV;


-- mod
function FOSSY_MOD (LHS: UNSIGNED; RHS: UNSIGNED) return UNSIGNED is
begin
  return FIX_INDEX(LHS rem RHS);
end FOSSY_MOD;
function FOSSY_MOD (LHS: SIGNED; RHS: SIGNED) return SIGNED is
begin
  return FIX_INDEX(LHS rem RHS);
end FOSSY_MOD;
function FOSSY_MOD (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return FOSSY_MOD(FOSSY_TO_SIGNED(LHS), RHS);
end FOSSY_MOD;
function FOSSY_MOD (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return FOSSY_MOD(LHS, FOSSY_TO_SIGNED(RHS));
end FOSSY_MOD;


-- rel ==
function FOSSY_EQ (LHS, RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_EQ(TO_STD_LOGIC_VECTOR(LHS), TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_EQ (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_EQ(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_EQ (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_EQ(FOSSY_TO_BOOL(LHS), RHS);
end;
function FOSSY_EQ (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_EQ(TO_STD_LOGIC_VECTOR(LHS), RHS);
end;
function FOSSY_EQ (LHS, RHS: SIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) = FOSSY_RESIZE(RHS, NEW_LENGTH));
end FOSSY_EQ;
function FOSSY_EQ (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_EQ(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_EQ (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_EQ(FOSSY_TO_BOOL(LHS), RHS);
end;
function FOSSY_EQ (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_EQ(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_EQ (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return (LHS = RHS);
end;
function FOSSY_EQ (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_EQ(LHS, FOSSY_TO_BOOL(RHS));
end;
function FOSSY_EQ (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_EQ(LHS, FOSSY_TO_BOOL(RHS));
end;
function FOSSY_EQ (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_EQ(LHS, FOSSY_TO_BOOL(RHS));
end;
function FOSSY_EQ (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) = FOSSY_RESIZE(RHS, NEW_LENGTH));
end FOSSY_EQ;
function FOSSY_EQ (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_EQ(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_EQ (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_EQ(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_EQ (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_EQ(FOSSY_TO_BOOL(LHS), RHS);
end;


-- rel !=
function FOSSY_NEQ (LHS, RHS: UNSIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS, RHS: SIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;
function FOSSY_NEQ (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return not (FOSSY_EQ(LHS, RHS));
end;


-- rel ||
function FOSSY_LOG_OR (LHS, RHS: UNSIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or RHS);
end;
function FOSSY_LOG_OR (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS, RHS: SIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or RHS);
end;
function FOSSY_LOG_OR (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return (LHS or RHS);
end;
function FOSSY_LOG_OR (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return (LHS or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return (LHS or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (LHS or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_OR (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) or RHS);
end;


-- rel &&
function FOSSY_LOG_AND (LHS, RHS: UNSIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and RHS);
end;
function FOSSY_LOG_AND (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS, RHS: SIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and RHS);
end;
function FOSSY_LOG_AND (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return (LHS and RHS);
end;
function FOSSY_LOG_AND (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return (LHS and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return (LHS and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (LHS and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and FOSSY_TO_BOOL(RHS));
end;
function FOSSY_LOG_AND (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return (FOSSY_TO_BOOL(LHS) and RHS);
end;


-- rel <
function FOSSY_LT (LHS, RHS: UNSIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) < FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_LT (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_LT (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LT(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LT (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LT(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LT (LHS, RHS: SIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) < FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_LT (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_LT(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_LT (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LT(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_LT (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LT(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LT (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LT (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_LT (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_LT (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LT (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LT (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_LT (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_LT (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;


-- rel <=
function FOSSY_LE (LHS, RHS: UNSIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) <= FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_LE (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_LE (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LE(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LE (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LE(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LE (LHS, RHS: SIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) <= FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_LE (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_LE(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_LE (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LE(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_LE (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LE(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LE (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LE (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_LE (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_LE (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LE (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_LE (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_LE (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_LE (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_LE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;


-- rel >
function FOSSY_GT (LHS, RHS: UNSIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) > FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_GT (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_GT (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GT(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GT (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GT(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GT (LHS, RHS: SIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) > FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_GT (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_GT(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_GT (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GT(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_GT (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GT(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GT (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GT (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_GT (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_GT (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GT (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GT (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_GT (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_GT (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GT(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;


-- rel >=
function FOSSY_GE (LHS, RHS: UNSIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) >= FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_GE (LHS: UNSIGNED; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_GE (LHS: UNSIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GE(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GE (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GE(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GE (LHS, RHS: SIGNED) return BOOLEAN is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return (FOSSY_RESIZE(LHS, NEW_LENGTH) >= FOSSY_RESIZE(RHS, NEW_LENGTH));
end;
function FOSSY_GE (LHS: SIGNED; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_GE(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_GE (LHS: SIGNED; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GE(LHS, FOSSY_TO_SIGNED(RHS));
end;
function FOSSY_GE (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GE(LHS, FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GE (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GE (LHS: BOOLEAN; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_GE (LHS: BOOLEAN; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_SIGNED(LHS), RHS);
end;
function FOSSY_GE (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GE (LHS, RHS: STD_LOGIC_VECTOR) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;
function FOSSY_GE (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_GE (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_UNSIGNED(LHS), RHS);
end;
function FOSSY_GE (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return BOOLEAN is
begin
  return FOSSY_GE(FOSSY_TO_UNSIGNED(LHS), FOSSY_TO_UNSIGNED(RHS));
end;


-- bit &
function FOSSY_BIT_AND (LHS, RHS: UNSIGNED) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS),
                                TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_AND (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_AND(FOSSY_TO_SIGNED(LHS), RHS));
end;
function FOSSY_BIT_AND (LHS: UNSIGNED; RHS: BOOLEAN) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS),
                                TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_AND (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS), RHS));
end;
function FOSSY_BIT_AND (LHS, RHS: SIGNED) return SIGNED is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return SIGNED(FOSSY_BIT_AND(
    TO_STD_LOGIC_VECTOR(FOSSY_RESIZE(LHS, NEW_LENGTH)),
    TO_STD_LOGIC_VECTOR(FOSSY_RESIZE(RHS, NEW_LENGTH))));
end;
function FOSSY_BIT_AND (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_AND(LHS, FOSSY_TO_SIGNED(RHS)));
end;
function FOSSY_BIT_AND (LHS: SIGNED; RHS: BOOLEAN) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS),
                              TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_AND (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS), RHS));
end;
function FOSSY_BIT_AND (LHS, RHS: BOOLEAN) return BOOLEAN is
begin return (RHS and LHS); end;
function FOSSY_BIT_AND (LHS: BOOLEAN; RHS: UNSIGNED) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS),
                                TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_AND (LHS: BOOLEAN; RHS: SIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS),
                              TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_AND (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_AND(TO_STD_LOGIC_VECTOR(LHS), RHS);
end;
function FOSSY_BIT_AND (LHS, RHS: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return FOSSY_RESIZE(LHS, NEW_LENGTH) and FOSSY_RESIZE(RHS, NEW_LENGTH);
end;
function FOSSY_BIT_AND (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_AND(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_BIT_AND (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_AND(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_BIT_AND (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_AND(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;


-- bit |
function FOSSY_BIT_OR (LHS, RHS: UNSIGNED) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS),
                               TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_OR (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_OR(FOSSY_TO_SIGNED(LHS), RHS));
end;
function FOSSY_BIT_OR (LHS: UNSIGNED; RHS: BOOLEAN) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS),
                               TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_OR (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS), RHS));
end;
function FOSSY_BIT_OR (LHS, RHS: SIGNED) return SIGNED is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return SIGNED(FOSSY_BIT_OR(
    TO_STD_LOGIC_VECTOR(FOSSY_RESIZE(LHS, NEW_LENGTH)),
    TO_STD_LOGIC_VECTOR(FOSSY_RESIZE(RHS, NEW_LENGTH))));
end;
function FOSSY_BIT_OR (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_OR(LHS, FOSSY_TO_SIGNED(RHS)));
end;
function FOSSY_BIT_OR (LHS: SIGNED; RHS: BOOLEAN) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS),
                             TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_OR (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS), RHS));
end;
function FOSSY_BIT_OR (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return (RHS or LHS);
end;
function FOSSY_BIT_OR (LHS: BOOLEAN; RHS: UNSIGNED) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS),
                               TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_OR (LHS: BOOLEAN; RHS: SIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS),
                             TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_OR (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_OR(TO_STD_LOGIC_VECTOR(LHS), RHS);
end;
function FOSSY_BIT_OR (LHS, RHS: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return FOSSY_RESIZE(LHS, NEW_LENGTH) or FOSSY_RESIZE(RHS, NEW_LENGTH);
end;
function FOSSY_BIT_OR (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_OR(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_BIT_OR (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_OR(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_BIT_OR (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_OR(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;


-- bit ^
function FOSSY_BIT_XOR (LHS, RHS: UNSIGNED) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS),
                                TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_XOR (LHS: UNSIGNED; RHS: SIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_XOR(FOSSY_TO_SIGNED(LHS), RHS));
end;
function FOSSY_BIT_XOR (LHS: UNSIGNED; RHS: BOOLEAN) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS),
                                TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_XOR (LHS: UNSIGNED; RHS: STD_LOGIC_VECTOR) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS), RHS));
end;
function FOSSY_BIT_XOR (LHS, RHS: SIGNED) return SIGNED is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return SIGNED(FOSSY_BIT_XOR(
    TO_STD_LOGIC_VECTOR(FOSSY_RESIZE(LHS, NEW_LENGTH)),
    TO_STD_LOGIC_VECTOR(FOSSY_RESIZE(RHS,NEW_LENGTH))));
end;
function FOSSY_BIT_XOR (LHS: SIGNED; RHS: UNSIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_XOR(LHS, FOSSY_TO_SIGNED(RHS)));
end;
function FOSSY_BIT_XOR (LHS: SIGNED; RHS: BOOLEAN) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS),
                              TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_XOR (LHS: SIGNED; RHS: STD_LOGIC_VECTOR) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS), RHS));
end;
function FOSSY_BIT_XOR (LHS, RHS: BOOLEAN) return BOOLEAN is
begin
  return (RHS xor LHS);
end;
function FOSSY_BIT_XOR (LHS: BOOLEAN; RHS: UNSIGNED) return UNSIGNED is
begin
  return UNSIGNED(FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS),
                                TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_XOR (LHS: BOOLEAN; RHS: SIGNED) return SIGNED is
begin
  return SIGNED(FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS),
                              TO_STD_LOGIC_VECTOR(RHS)));
end;
function FOSSY_BIT_XOR (LHS: BOOLEAN; RHS: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_XOR(TO_STD_LOGIC_VECTOR(LHS), RHS);
end;
function FOSSY_BIT_XOR (LHS, RHS: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
  constant NEW_LENGTH : NATURAL := FOSSY_MAX(LHS'LENGTH, RHS'LENGTH);
begin
  return FOSSY_RESIZE(LHS, NEW_LENGTH) xor FOSSY_RESIZE(RHS, NEW_LENGTH);
end;
function FOSSY_BIT_XOR (LHS: STD_LOGIC_VECTOR; RHS: UNSIGNED) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_XOR(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_BIT_XOR (LHS: STD_LOGIC_VECTOR; RHS: SIGNED) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_XOR(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;
function FOSSY_BIT_XOR (LHS: STD_LOGIC_VECTOR; RHS: BOOLEAN) return STD_LOGIC_VECTOR is
begin
  return FOSSY_BIT_XOR(LHS, TO_STD_LOGIC_VECTOR(RHS));
end;


-- bit <<
function FOSSY_SHL (LHS: UNSIGNED; RHS: NATURAL; SIZE: NATURAL) return UNSIGNED is
begin
  return SHIFT_LEFT(FOSSY_RESIZE(LHS, SIZE), RHS);
end;
function FOSSY_SHL (LHS: SIGNED; RHS: NATURAL; SIZE: NATURAL) return SIGNED is
begin
  return SHIFT_LEFT(FOSSY_RESIZE(LHS, SIZE), RHS);
end;
function FOSSY_SHL (LHS: STD_LOGIC_VECTOR; RHS: NATURAL; SIZE: NATURAL) return STD_LOGIC_VECTOR is
begin
  return TO_STD_LOGIC_VECTOR(FOSSY_SHL(FOSSY_TO_UNSIGNED(LHS), RHS, SIZE));
end;


-- bit >>
function FOSSY_SHR (LHS: UNSIGNED; RHS: NATURAL) return UNSIGNED is
begin
  return SHIFT_RIGHT(LHS, RHS);
end;
function FOSSY_SHR (LHS: SIGNED; RHS: NATURAL) return SIGNED is
begin
  return SHIFT_RIGHT(LHS, RHS);
end;
function FOSSY_SHR (LHS: STD_LOGIC_VECTOR; RHS: NATURAL) return STD_LOGIC_VECTOR is
begin
  return TO_STD_LOGIC_VECTOR(FOSSY_SHR(FOSSY_TO_UNSIGNED(LHS), RHS));
end;

end package body FOSSY_INTLIB;
