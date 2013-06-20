/***************************************************************************
 *   Copyright (c) J�rgen Riegel          (juergen.riegel@web.de) 2002     *
 *                                                                         *
 *   This file is part of the FreeCAD CAx development system.              *
 *                                                                         *
 *   This library is free software; you can redistribute it and/or         *
 *   modify it under the terms of the GNU Library General Public           *
 *   License as published by the Free Software Foundation; either          *
 *   version 2 of the License, or (at your option) any later version.      *
 *                                                                         *
 *   This library  is distributed in the hope that it will be useful,      *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU Library General Public License for more details.                  *
 *                                                                         *
 *   You should have received a copy of the GNU Library General Public     *
 *   License along with this library; see the file COPYING.LIB. If not,    *
 *   write to the Free Software Foundation, Inc., 59 Temple Place,         *
 *   Suite 330, Boston, MA  02111-1307, USA                                *
 *                                                                         *
 ***************************************************************************/

#ifndef PARTGUI_DLGPARTCYLINDERIMP_H
#define PARTGUI_DLGPARTCYLINDERIMP_H

#include "ui_DlgPartCylinder.h"
#include <Gui/InputVector.h>

namespace PartGui {

class DlgPartCylinderImp : public Gui::LocationInterface<Ui_DlgPartCylinder>
{
    Q_OBJECT

public:
    DlgPartCylinderImp(QWidget* parent = 0, Qt::WFlags fl = 0);
    ~DlgPartCylinderImp();
};

} // namespace PartGui

#endif // PARTGUI_DLGPARTCYLINDERIMP_H