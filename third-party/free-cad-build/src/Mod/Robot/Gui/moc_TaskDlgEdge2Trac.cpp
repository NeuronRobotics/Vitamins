/****************************************************************************
** Meta object code from reading C++ file 'TaskDlgEdge2Trac.h'
**
** Created: Thu Apr 18 07:26:59 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../free-cad/src/Mod/Robot/Gui/TaskDlgEdge2Trac.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TaskDlgEdge2Trac.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_RobotGui__TaskDlgEdge2Trac[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_RobotGui__TaskDlgEdge2Trac[] = {
    "RobotGui::TaskDlgEdge2Trac\0"
};

void RobotGui::TaskDlgEdge2Trac::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData RobotGui::TaskDlgEdge2Trac::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject RobotGui::TaskDlgEdge2Trac::staticMetaObject = {
    { &Gui::TaskView::TaskDialog::staticMetaObject, qt_meta_stringdata_RobotGui__TaskDlgEdge2Trac,
      qt_meta_data_RobotGui__TaskDlgEdge2Trac, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &RobotGui::TaskDlgEdge2Trac::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *RobotGui::TaskDlgEdge2Trac::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *RobotGui::TaskDlgEdge2Trac::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RobotGui__TaskDlgEdge2Trac))
        return static_cast<void*>(const_cast< TaskDlgEdge2Trac*>(this));
    typedef Gui::TaskView::TaskDialog QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int RobotGui::TaskDlgEdge2Trac::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef Gui::TaskView::TaskDialog QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
