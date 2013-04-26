
// This file is generated by src/Tools/generateTemaplates/templateClassPyExport.py out of the XML file
// Every change you make here get lost at the next full rebuild!
#ifndef PART_BREPOFFSETAPI_MAKEPIPESHELLPY_H
#define PART_BREPOFFSETAPI_MAKEPIPESHELLPY_H

#include <Base/PyObjectBase.h>
#include <BRepOffsetAPI_MakePipeShell.hxx>
#include <string>

namespace Part
{

//===========================================================================
// BRepOffsetAPI_MakePipeShellPy - Python wrapper
//===========================================================================

/** The python export class for BRepOffsetAPI_MakePipeShell
 */
class PartExport BRepOffsetAPI_MakePipeShellPy : public Base::PyObjectBase
{
public:
    static PyTypeObject   Type;
    static PyMethodDef    Methods[];
    static PyGetSetDef    GetterSetter[];
    static PyParentObject Parents[];
    virtual PyTypeObject *GetType(void) {return &Type;};
    virtual PyParentObject *GetParents(void) {return Parents;}

public:
    BRepOffsetAPI_MakePipeShellPy(BRepOffsetAPI_MakePipeShell *pcObject, PyTypeObject *T = &Type);
    static PyObject *PyMake(struct _typeobject *, PyObject *, PyObject *);
    virtual int PyInit(PyObject* args, PyObject*k);
    ~BRepOffsetAPI_MakePipeShellPy();

    typedef BRepOffsetAPI_MakePipeShell* PointerType ;

    virtual PyObject *_repr(void);        // the representation
    std::string representation(void) const;

    /** @name callbacks and implementers for the python object methods */
    //@{
    /// callback for the setFrenetMode() method
    static PyObject * staticCallback_setFrenetMode (PyObject *self, PyObject *args);
    /// implementer for the setFrenetMode() method
    PyObject*  setFrenetMode(PyObject *args);
    /// callback for the setTrihedronMode() method
    static PyObject * staticCallback_setTrihedronMode (PyObject *self, PyObject *args);
    /// implementer for the setTrihedronMode() method
    PyObject*  setTrihedronMode(PyObject *args);
    /// callback for the setBiNormalMode() method
    static PyObject * staticCallback_setBiNormalMode (PyObject *self, PyObject *args);
    /// implementer for the setBiNormalMode() method
    PyObject*  setBiNormalMode(PyObject *args);
    /// callback for the setSpineSupport() method
    static PyObject * staticCallback_setSpineSupport (PyObject *self, PyObject *args);
    /// implementer for the setSpineSupport() method
    PyObject*  setSpineSupport(PyObject *args);
    /// callback for the setAuxiliarySpine() method
    static PyObject * staticCallback_setAuxiliarySpine (PyObject *self, PyObject *args);
    /// implementer for the setAuxiliarySpine() method
    PyObject*  setAuxiliarySpine(PyObject *args);
    /// callback for the add() method
    static PyObject * staticCallback_add (PyObject *self, PyObject *args);
    /// implementer for the add() method
    PyObject*  add(PyObject *args);
    /// callback for the remove() method
    static PyObject * staticCallback_remove (PyObject *self, PyObject *args);
    /// implementer for the remove() method
    PyObject*  remove(PyObject *args);
    /// callback for the isReady() method
    static PyObject * staticCallback_isReady (PyObject *self, PyObject *args);
    /// implementer for the isReady() method
    PyObject*  isReady(PyObject *args);
    /// callback for the getStatus() method
    static PyObject * staticCallback_getStatus (PyObject *self, PyObject *args);
    /// implementer for the getStatus() method
    PyObject*  getStatus(PyObject *args);
    /// callback for the makeSolid() method
    static PyObject * staticCallback_makeSolid (PyObject *self, PyObject *args);
    /// implementer for the makeSolid() method
    PyObject*  makeSolid(PyObject *args);
    /// callback for the setTolerance() method
    static PyObject * staticCallback_setTolerance (PyObject *self, PyObject *args);
    /// implementer for the setTolerance() method
    PyObject*  setTolerance(PyObject *args);
    /// callback for the setTransitionMode() method
    static PyObject * staticCallback_setTransitionMode (PyObject *self, PyObject *args);
    /// implementer for the setTransitionMode() method
    PyObject*  setTransitionMode(PyObject *args);
    /// callback for the firstShape() method
    static PyObject * staticCallback_firstShape (PyObject *self, PyObject *args);
    /// implementer for the firstShape() method
    PyObject*  firstShape(PyObject *args);
    /// callback for the lastShape() method
    static PyObject * staticCallback_lastShape (PyObject *self, PyObject *args);
    /// implementer for the lastShape() method
    PyObject*  lastShape(PyObject *args);
    /// callback for the build() method
    static PyObject * staticCallback_build (PyObject *self, PyObject *args);
    /// implementer for the build() method
    PyObject*  build(PyObject *args);
    /// callback for the shape() method
    static PyObject * staticCallback_shape (PyObject *self, PyObject *args);
    /// implementer for the shape() method
    PyObject*  shape(PyObject *args);
    /// callback for the generated() method
    static PyObject * staticCallback_generated (PyObject *self, PyObject *args);
    /// implementer for the generated() method
    PyObject*  generated(PyObject *args);
    //@}


    /** @name callbacks and implementers for the python object attributes */
    //@{
    //@}

    /// getter method for special attributes (e.g. dynamic ones)
    PyObject *getCustomAttributes(const char* attr) const;
    /// setter for special attributes (e.g. dynamic ones)
    int setCustomAttributes(const char* attr, PyObject *obj);
    PyObject *_getattr(char *attr);              // __getattr__ function
    int _setattr(char *attr, PyObject *value);        // __setattr__ function

    /// getter for the object handled by this class
    BRepOffsetAPI_MakePipeShell *getBRepOffsetAPI_MakePipeShellPtr(void) const;

    /** @name additional declarations and methods for the wrapper class */
    //@{

    //@}
};

#define PARENTSPartBRepOffsetAPI_MakePipeShellPy &BRepOffsetAPI_MakePipeShellPy::Type,PARENTSBasePyObjectBase

}  //namespace Part

#endif  // PART_BREPOFFSETAPI_MAKEPIPESHELLPY_H

