Return-Path: <SRS0=lg0B=3G=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1442C33CAF
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 01:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C48F220728
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 01:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579224872;
	bh=BG6Kcxme12IshntrWgGxA+GfTGdLbmYOo2jinlXCCmk=;
	h=In-Reply-To:References:Subject:Cc:To:From:Date:List-ID:From;
	b=dtioToT5ZWVf4B8iu50vKyYD/iooJuylsoUuXg7Qi4evJoncRmYr6qid4ST0X7Nr6
	 I/aSb99lHHP3kUGW1SxngjquWVAErgyL99g1brznfXvNZxazqDTnRoQ6MGS+N2qly5
	 0gWM9C6+Cfle/+IxCnXeAeTlbQA0QNuk6euQ6tYI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730156AbgAQBec (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Jan 2020 20:34:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:50494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731058AbgAQBec (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 16 Jan 2020 20:34:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E2BD20728;
        Fri, 17 Jan 2020 01:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579224871;
        bh=BG6Kcxme12IshntrWgGxA+GfTGdLbmYOo2jinlXCCmk=;
        h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
        b=pf4wAQfD9iTd77BHQNOfksYquObHEkkyInRd+ssAxjiRrltqBDorkd/WsdEkXinN/
         teZGYJLmtnWrwqvwrS70AOOIBl4lM72FyRDAKxpEg9Wywc9O9wfZVHWMsZUYcRCAdT
         tNLsA6/N3yjCJWrpw4qWTVkiC7Ml1K/h6gFL/S78=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABhMZUW5O3nMJFh+D0cTVt6jviAQw8eC+0Kx7_w38h+dRVTuxw@mail.gmail.com>
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com> <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com> <CABhMZUW5O3nMJFh+D0cTVt6jviAQw8eC+0Kx7_w38h+dRVTuxw@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of Code mentoring program?
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>
To:     Bjorn Helgaas <bjorn.helgaas@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>, bjorn@helgaas.com
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 16 Jan 2020 17:34:30 -0800
Message-Id: <20200117013431.6E2BD20728@mail.kernel.org>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Quoting Bjorn Helgaas (2020-01-15 15:03:47)
> On Wed, Jan 15, 2020 at 4:07 PM Michael Turquette
> <mturquette@baylibre.com> wrote:
>=20
> > I added the first entry, "Bidirectionally sync Patchwork patch status
> > with Gmail labels". Stephen Boyd and I use a local solution to
> > coordinate patches in the Linux Clk tree. Our solution requires
> > Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
> > proposal is to remove the Notmuch requirements and teach Patchwork to
> > talk directly to Gmail (and vice versa), perhaps via a solution in the
> > cloud, running on a server somewhere, and not dependent on the uptime
> > of my laptop.
> >
> > From my discussions with kernel devs, I believe there is a reasonably
> > sized Venn diagram of people that use both Patchwork for patch
> > tracking as well as Gmail/G Suite for email. Having those two talk
> > might mean that I never have to use the Patchwork web interface again,
> > a big win IMO, and I can just use email.
>=20
> That's a really cool idea.  What do you do about the Gmail/plain text
> problem?  I know Gmail *can* sent plain-text email, but you don't have
> much control over the formatting, and I really don't like reviewing
> code in a Gmail draft.  I hate to admit it, but I'm always bouncing
> back and forth between Gmail and mutt.

I don't use gmail at all for composing or sending emails. I basically
use it as a glorified label and email storage database. Downside is I
can't work on my phone, which is probably a good thing when I have to
write something long but a bad thing when I just want to apply the patch
and integrate it into my tree.

I've dreamed about moving away from gmail entirely and just syncing down
the mbox files from lore.kernel.org for linux-clk (or maybe that thing
that catches all the lists that have my kernel.org address in the to or
cc) and then writing a UI around mbox files that I can use to reply and
tag/update patchwork state. Basically treat lore as my email storage
database. This fails when people want to email me privately, so maybe
I'll have to keep injecting the patchwork files into my notmuch database
for now.

