# -*- coding: utf-8 -*-
from datetime import datetime
import sys
import connexion


def root():
    cur_time = datetime.now().isoformat()
    return {'name': 'demo-data-one', 'time': cur_time}


def get_summary_uris():
    years = xrange(2007,2015)
    return [{'year': y, 'link': "/summary/costs/{}".format(y)} for y in years]


def get_summary(year):
    from xlrd import open_workbook, XL_CELL_TEXT

    try:
        if year in xrange(2007, 2011):
            book = open_workbook('data/ic2010_ay.xls')
            sheet = book.sheet_by_name('Statistics')

            in_state_tuition = {
                # the tuple is : in-state tuition + fees, books/supplies
                2007: (sheet.cell(74, 4).value, sheet.cell(100, 4).value),
                2008: (sheet.cell(77, 4).value, sheet.cell(101, 4).value),
                2009: (sheet.cell(80, 4).value, sheet.cell(102, 4).value),
                2010: (sheet.cell(83, 4).value, sheet.cell(100, 4).value)
            }
            # out_of_state_tuition = {
            #     '2007': sheet.cell(88, 4).value,
            #     '2008': sheet.cell(91, 4).value,
            #     '2009': sheet.cell(94, 4).value,
            #     '2010': sheet.cell(97, 4).value
            # }
            return dict(zip(['tuition_and_fees', 'books_and_supplies'], in_state_tuition[year]))
        elif year in xrange(2011, 2015):
            book = open_workbook('data/ic2014_ay.xlsx')
            sheet = book.sheet_by_name('Statistics')

            in_state_tuition = {
                2011: (sheet.cell(71, 4).value, sheet.cell(97, 4).value),
                2012: (sheet.cell(74, 4).value, sheet.cell(98, 4).value),
                2013: (sheet.cell(77, 4).value, sheet.cell(99, 4).value),
                2014: (sheet.cell(80, 4).value, sheet.cell(100, 4).value)
            }
            # out_of_state_tuition = {
            #     '2011': sheet.cell(85, 4).value,
            #     '2012': sheet.cell(88, 4).value,
            #     '2013': sheet.cell(91, 4).value,
            #     '2014': sheet.cell(94, 4).value
            # }
            return dict(zip(['tuition_and_fees', 'books_and_supplies'], in_state_tuition[year]))
        else:
            return {"error": "Data for year {} not found.".format(year)}
    except IOError:
        print sys.exc_info()
        # Internal Server Error - NOT GOOD, but do something about it!
        return {}

if __name__ == '__main__':
    app = connexion.App(__name__, specification_dir='apispec/')
    app.add_api('data_api.yaml')

    # start the server
    app.run(port=1234)