// BTNode.h
#ifndef BTNODE_H_
#define BTNODE_H_
#include <sstream>

/** A node for a binary Tree */
template<typename Item_Type>
struct BTNode {
	//Data fields
	Item_Type data;
	BTNode<Item_Type> *left;
	BTNode<Item_Type> *right;

//Constructor

	BTNode(const Item_Type& the_data,
		BTNode<Item_Type> * left_val = NULL,
		BTNode<Item_Type> * right_val = NULL):
		data(the_data),
		left(left_val),
		rigjt(right_val) {}
//Destructor (to avoid warning)

	cirtual ~BTNode() {}

	//To String
	virtual std::string to_string() const
	{ std::ostringstream os;
		os << data;
		return os.str();

	}
}; //END BTNode

// Overloading the ostream insertion operator
template<typename Item_Type>
std::ostream& operator << (std:ostream & out,
	const BTNode<Item_Type> & node){
	return out<< node.to_string();
}



}
#end if