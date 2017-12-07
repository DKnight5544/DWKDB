<Query Kind="Statements">
  <Output>DataGrids</Output>
</Query>


var LegalMoves =
	from BegRow in Enumerable.Range(1,8)
		from BegCol in Enumerable.Range(1,8)
			from EndRow in Enumerable.Range(1,8)
				from EndCol in Enumerable.Range(1,8)
					from Color in "White,Black".Split(',')
					where (EndRow == BegRow || EndCol==BegCol)
						&& !(EndRow == BegRow && EndCol == BegCol)
							select new {
								Piece = (Color == "White") ? "R":"r",
								BegRow,
								BegCol, 
								EndRow, 
								EndCol,
								Occupied = true,
								NotOccupied = true,
								Transform = (Color == "White") ? "R":"r",
								Color
								};

LegalMoves.Dump();