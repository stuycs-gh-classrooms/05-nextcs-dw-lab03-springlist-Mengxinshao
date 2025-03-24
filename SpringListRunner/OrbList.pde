class OrbList {

  OrbNode front;

  /*===========================
    Contructor
    Does very little.
    You do not need to modify this method.
    =========================*/
  OrbList() {
    front = null;
  }//constructor

  /*===========================
    addFront(OrbNode o)

    Insert o to the beginning of the list.
    =========================*/
  void addFront(OrbNode o) {
  if (front == null) {
    front = o;
  } else {
    o.next = front;
    front.previous = o;
    front = o;
  }
}//addFront


  /*===========================
    populate(int n, boolean ordered)

    Clear the list.
    Add n randomly generated  orbs to the list,
    using addFront.
    If ordered is true, the orbs should all
    have the same y coordinate and be spaced
    SPRING_LEGNTH apart horizontally.
    =========================*/
  void populate(int n, boolean ordered) {
  front = null;

  for (int i = 0; i < n; i++) {
    float size = random(MIN_SIZE, MAX_SIZE);//Randomize size for each orb
    
    println("New OrbNode - bsize: " + size);
    
    float mass = random(MIN_MASS, MAX_MASS);
    float x, y;

    if (ordered) {
      x = i * SPRING_LENGTH + size / 2;
      y = height / 2;//Place orbs horizontally in the middle
    } else {
      x = random(size / 2, width - size / 2);
      y = random(size / 2, height - size / 2);
    }

    OrbNode newNode = new OrbNode(x, y, size, mass);
    addFront(newNode);
  }
}//populate

  /*===========================
    display(int springLength)

    Display all the nodes in the list using
    the display method defined in the OrbNode class.
    =========================*/
  void display() {
  OrbNode current = front;
  while (current != null) {
    current.display();
    current = current.next;
  }
}//display

  /*===========================
    applySprings(int springLength, float springK)

    Use the applySprings method in OrbNode on each
    element in the list.
    =========================*/
  void applySprings(int springLength, float springK) {
  OrbNode current = front;
  while (current != null) {
    current.applySprings(springLength, springK);
    current = current.next;
  }
}//applySprings

  /*===========================
    applyGravity(Orb other, float gConstant)

    Use the getGravity and applyForce methods
    to apply gravity crrectly.
    =========================*/
  void applyGravity(Orb other, float gConstant) {
  OrbNode current = front;
  while (current != null) {
    PVector gravityForce = current.getGravity(other, gConstant);
    current.applyForce(gravityForce);
    current = current.next;
  }
}//applySprings

  /*===========================
    run(boolean bounce)

    Call run on each node in the list.
    =========================*/
  void run(boolean bounce) {
  OrbNode current = front;
  while (current != null) {
    current.move(bounce);
    current = current.next;
  }
}//applySprings

  /*===========================
    removeFront()

    Remove the element at the front of the list, i.e.
    after this method is run, the former second element
    should now be the first (and so on).
    =========================*/
  void removeFront() {
  if (front != null) {
    front = front.next;
    if (front != null) {
      front.previous = null;
    }
  }
}//removeFront


  /*===========================
    getSelected(float x, float y)

    If there is a node at (x, y), return
    a reference to that node.
    Otherwise, return null.

    See isSlected(float x, float y) in
    the Orb class (line 115).
    =========================*/
  OrbNode getSelected(int x, int y) {
  OrbNode current = front;
  while (current != null) {
    if (current.isSelected(x, y)) {
      return current;
    }
    current = current.next;
  }
  return null;
}//getSelected

  /*===========================
    removeNode(OrbNode o)

    Removes o from the list. You can
    assume o is an OrbNode in the list.
    You cannot assume anything about the
    position of o in the list.
    =========================*/
  void removeNode(OrbNode o) {
  if (o == null) return;

  if (o.previous != null) {
    o.previous.next = o.next;
  } else {
    front = o.next;//If removing the first node, update front
  }

  if (o.next != null) {
    o.next.previous = o.previous;
  }
}
}//OrbList
