Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415112838F
	for <workflows@vger.kernel.org>; Fri, 23 Feb 2024 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708708447; cv=none; b=PR9qbr6vm2s8BWLMWGZW6RzkldTgXz9pvOSfzJ+JKd2DVw15XiTA2lKXbarF09aZzAnPQn0q4REsxlpk0pN1pokh2NCE147qNJcjYkL7oEEX3S6rIcOlKkyrt9YwlUNp3G81eSZrKH0ky6S6qV1ezA4zLx0KVYTVGtNP7W1yT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708708447; c=relaxed/simple;
	bh=1nvxyZBAC40Zn08RgW/5cyiFlEblu7mS1/neGgKkxTY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/r+3CrwxreHus/z+HePLOdDh4dsLH4kQi9u1xk5i0igJvNlYxxrVs6Sz6U2BOWqA/JUH9QcrHhJ2CuAAebyYD+DqS5MOipGbqDE4LL8Z2X3XUVXC4wOivVgVX5JZG4L4vHzSfn742whOSXy67Gxy6/b4YRcocw4c/7muvcaxSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuW+oE77; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuW+oE77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6B9C433F1;
	Fri, 23 Feb 2024 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708708447;
	bh=1nvxyZBAC40Zn08RgW/5cyiFlEblu7mS1/neGgKkxTY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CuW+oE77wOzXNijcxnLTDJqg1ZGqjdIyggUa/BJCRpeqoLuvsBa2PK8Lmn0ikLgTO
	 KSAmzLtiIMmjDIflRR//X/dvOG1LhAB7OO41gJYi5hoBXvGUFuBDC8LM77tXGFy314
	 d+6DYcqhs078BTk6hUia2Nm5acGY4PnBNlHjlJBIIclQDrYG5qmU7Sc5WOmQsWW+aW
	 JAkBYBUUlrjv2Ik7lDfR6IdVuewIZnB42hBwr13qeevHaOiJRRnSXOeP6SiH59W/Vf
	 ukQDXOagvDeOgm7URLIFMlBzB74PNGBdqWQQREk3fKtUoE8DjTIPnpbIxBF8taq+kn
	 RUWF5tI4ItETQ==
Date: Fri, 23 Feb 2024 18:14:03 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: workflows@vger.kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, corbet@lwn.net, ast@kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
Message-ID: <20240223175523.5a428f28@coco.lan>
In-Reply-To: <20240223083154.4fbee63c@kernel.org>
References: <20240223083154.4fbee63c@kernel.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 23 Feb 2024 08:31:54 -0800
Jakub Kicinski <kuba@kernel.org> escreveu:

> Hi!
> 
> We have a few netdev-related bots with various simple status pages.
> I hooked them up to analytics recently, here's the dash:
> https://plausible.io/netdev.bots.linux.dev
> 
> Plausible was described here: https://lwn.net/Articles/822568/
> it's supposedly-open, and privacy-focused, no cookies etc.
> 
> It's useful for me when deciding where to invest my time,
> and to back up the efforts to my employer with some data.
> 
> Now, most of us agree that kernel docs leave something to be desired.
> At the same time maintainers are repeatedly faced with people who post
> code without reading the docs, which puts the time invested in writing
> them into question. I can't help but think that providing some
> analytics for docs.kernel.org traffic would be beneficial. 
> I would use it.
> 
> Thoughts?
> 
> Does anyone think that even non-intrusive analytics are a no go?
> 
> Does anyone know better alternatives than Plausible?

I have a small hand-made script using Pandas/Seaborn to produce
some patchwork statistics as can be seen at:

	https://linuxtv.org/patchwork_stats.php

Feel free to use it as a basis to get some stats.

You may need to modify it to cover stats per project (on Linux media, there's
just two projects, and the second one with handful number of patches per year).
So, we didn't need to filter it per project.

Also, please notice that the second query doesn't use any index on Patwork 3.1. 

I ended manually creating an index to speed it up on mariadb with:

	CREATE INDEX idx_patchwork_patch_stateid_date on patchwork_patch(state_id, date);

I hope that helps.

Regards,
Mauro

---

#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-2.0
# Copyright(c) Mauro Carvalho Chehab <mchehab@kernel.org>

from datetime import datetime, date, timedelta
from matplotlib.dates import DateFormatter
from matplotlib.pyplot import xlim
from pandas import read_sql
from seaborn import relplot, set_style,axes_style
from sqlalchemy import create_engine, text

DIR = './'

def log(msg):
    now = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
    print(f'{now}: {msg}')

today = date.today()

# Consider yesterday as the final date
end_date = today - timedelta(days=1)

# Two complete years + this month
start_date = end_date.replace(year=today.year - 2).replace(month=today.month - 1)
start_date = start_date.replace(day=1)

interval = f'date >= "{start_date}" and date <= "{end_date}"'

log("Connecting to database")

engine = create_engine("mysql://patchwork:yaicCoqui@localhost/patchwork?charset=utf8mb4")

palette = "bright"
background = "#555555"

style = {
    'axes.facecolor':background,
    'grid.color':'white',
    'axes.edgecolor': 'orange',
    'axes.labelcolor': 'orange',
    'text.color': '#ffcc00',
    'xtick.color': 'white',
    'ytick.color': 'white',
    'patch.edgecolor': 'orange',
    'figure.facecolor':'black'
}


xformatter = DateFormatter("%Y-%m")

with engine.connect() as conn:
     # Total patches
    query = text(f'select DATE_FORMAT(date, "%Y-%m") AS date, count(*) AS patches from patchwork_patch WHERE {interval} group by DATE_FORMAT(date, "%Y-%m") ORDER BY YEAR(date), MONTH(DATE)')
    log(query)
    total = read_sql(query, con=conn, parse_dates=['date'])

    log("Creating total patches graph")

    set_style(style="darkgrid",rc=style)

    print({k: v for k, v in axes_style().items() if "color" in k})

    g = relplot(kind="line", marker='x', markers=True, data=total, x="date", y="patches")
    g.set_axis_labels("Date", "Number of patches", labelpad=10)
    g.set(title=f'Number of patches received per month between {start_date} and {end_date}')
    g.figure.set_size_inches(14, 6)
    print(g.ax)
    g.ax.margins(.05)
    g.ax.autoscale_view()
    g.ax.edgecolor="black"
    g.despine(trim=True, left=True, bottom=True)
    xlim(start_date, end_date)
    g.axes[0,0].xaxis.set_major_formatter(xformatter)

    g.savefig(DIR + 'patches_per_date.svg')

    # Patches per state
    query = text(f'select DATE_FORMAT(date, "%Y-%m") as date, st.name as State, count(*) as patches from patchwork.patchwork_patch AS p, patchwork_state as st where state_id = st.id and {interval} group by DATE_FORMAT(date, "%Y-%m"), st.id')
    log(query)
    per_state = read_sql(query, con=conn, parse_dates=['date'])

    log("Creating patches per state")

    per_state.set_index('date', inplace=True)

    g = relplot(kind="line", data=per_state, x="date", y="patches", hue="State", markers="State", marker="X", palette=palette)

    g.set_axis_labels("Date", "Number of patches", labelpad=10)
    g.set(title=f'Number of patches per state received per month between {start_date} and {end_date}')
    g.figure.set_size_inches(13.5, 6)
    g.ax.margins(.05)
    g.ax.autoscale_view()
    g.ax.edgecolor=False
    g.despine(trim=True, left=True, bottom=True)
    xlim(start_date, end_date)
    g.axes[0,0].xaxis.set_major_formatter(xformatter)

    g.add_legend(loc='upper left', bbox_to_anchor=(1.12, 0.5))
    g.savefig(DIR + 'patches_per_state.svg')

    log("Done.")
