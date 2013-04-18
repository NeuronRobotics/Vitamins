
// This file is generated by src/Tools/generateTemaplates/templateClassPyExport.py out of the XML file
// Every change you make here get lost at the next full rebuild!
#ifndef APP_DOCUMENTOBJECTGROUPPY_H
#define APP_DOCUMENTOBJECTGROUPPY_H

#include <App/DocumentObjectPy.h>
#include <App/DocumentObjectGroup.h>
#include <string>

namespace App
{

//===========================================================================
// DocumentObjectGroupPy - Python wrapper
//===========================================================================

/** The python export class for DocumentObjectGroup
 */
class AppExport DocumentObjectGroupPy : public App::DocumentObjectPy
{
public:
    static PyTypeObject   Type;
    static PyMethodDef    Methods[];
    static PyGetSetDef    GetterSetter[];
    static PyParentObject Parents[];
    virtual PyTypeObject *GetType(void) {return &Type;};
    virtual PyParentObject *GetParents(void) {return Parents;}

public:
    DocumentObjectGroupPy(DocumentObjectGroup *pcObject, PyTypeObject *T = &Type);
    static PyObject *PyMake(struct _typeobject *, PyObject *, PyObject *);
    virtual int PyInit(PyObject* args, PyObject*k);
    ~DocumentObjectGroupPy();

    typedef DocumentObjectGroup* PointerType ;

    virtual PyObject *_repr(void);        // the representation
    std::string representation(void) const;

    /** @name callbacks and implementers for the python object methods */
    //@{
    /// callback for the newObject() method
    static PyObject * staticCallback_newObject (PyObject *self, PyObject *args);
    /// implementer for the newObject() method
    PyObject*  newObject(PyObject *args);
    /// callback for the addObject() method
    static PyObject * staticCallback_addObject (PyObject *self, PyObject *args);
    /// implementer for the addObject() method
    PyObject*  addObject(PyObject *args);
    /// callback for the removeObject() method
    static PyObject * staticCallback_removeObject (PyObject *self, PyObject *args);
    /// implementer for the removeObject() method
    PyObject*  removeObject(PyObject *args);
    /// callback for the removeObjectsFromDocument() method
    static PyObject * staticCallback_removeObjectsFromDocument (PyObject *self, PyObject *args);
    /// implementer for the removeObjectsFromDocument() method
    PyObject*  removeObjectsFromDocument(PyObject *args);
    /// callback for the getObject() method
    static PyObject * staticCallback_getObject (PyObject *self, PyObject *args);
    /// implementer for the getObject() method
    PyObject*  getObject(PyObject *args);
    /// callback for the hasObject() method
    static PyObject * staticCallback_hasObject (PyObject *self, PyObject *args);
    /// implementer for the hasObject() method
    PyObject*  hasObject(PyObject *args);
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
    DocumentObjectGroup *getDocumentObjectGroupPtr(void) const;

    /** @name additional declarations and methods for the wrapper class */
    //@{

    //@}
};

#define PARENTSAppDocumentObjectGroupPy &DocumentObjectGroupPy::Type,PARENTSAppDocumentObjectPy

}  //namespace App

#endif  // APP_DOCUMENTOBJECTGROUPPY_H


