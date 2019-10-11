Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CA5C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 12:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8969420679
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 12:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfJKM4F (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 08:56:05 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:37624 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727589AbfJKM4F (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 08:56:05 -0400
Received: from callcc.thunk.org (guestnat-104-132-34-105.corp.google.com [104.132.34.105] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9BCsGXH002568
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Oct 2019 08:54:17 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 2F52E42045A; Fri, 11 Oct 2019 08:54:16 -0400 (EDT)
Date:   Fri, 11 Oct 2019 08:54:16 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191011125416.GB16225@mit.edu>
References: <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CACT4Y+YcM6U53FpJ6dtjk6CDmW0POVwbyvxJLZx-u+NZOgM_aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+YcM6U53FpJ6dtjk6CDmW0POVwbyvxJLZx-u+NZOgM_aw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 01:01:04PM +0200, Dmitry Vyukov wrote:
> Good point. I wonder if it's possible to choose a more-git-friendly
> storage scheme and to optimize the OSS git to get to the necessary
> scalability level. I am asking because "optimizing some piece of
> software" looks like a smaller part in the grand scheme of things of
> the overall problem (unless of course there are some fundamental
> conflicts between git and efficient storage for this type of data).

It's certainly possible; Jgit is open source (licensed under the
Eclipse Public License), and while G-o-B is not open sourced (since it
needs to interface with internal Google infrastructure, such as Big
Table, it wouldn't help if it was open sourced), I suspect it wouldn't
be hard to create new Java classes for jgit which used some other
backend storage, such as Postgres.  That being said running a
Jgit/Postgres server is probably going to be quite bit more
complicated than the OSS git.

> However, I mainly wanted to point out a higher-level consideration.
> Total doomsday resistance, assuming every party in the world is an
> adversary and total decentralization are nice properties, but each of
> them makes project design and implementation an order or magnitude
> harder. So the question is: are the following requirements would be
> enough:
>  - open-source implementation
>  - transparent raw data format
>  - ability to export and backup all data natively (each user may even
> have a complete replica of whole raw data for the "local patchwork"
> thing)
>  - ability to do most of the work locally
>  - not owning user identities/be able to export user identities
>  - maybe something else, but you get the idea
> ?

This is a good point, and I agree.  And whether we use something like
Jgit, or OSS git, or Google's G-o-B, or Microsoft's highly scalable
git reimplementation, is really is an implementation detail.  So long
as we know that our requirements have viable solutions, we don't need
to rathole on the which solution is best.

And if we have an independent implementation which _could_ scale, and
could be stood up and demonstrate could work for a small set of trees,
if some large company were to contribute the infrastructure so that
could run at scale for most of the kernel subsystems' git trees,
perhaps we would be OK with a solution which is centralized-at-least-in-practice?

After all, lore.kernel.org is centralized at least in practice, and
it's convenient that it archives many of the kernel's mailing lists
(on vger as well as others) because when a message is CC'ed to many
lists, it can be more efficient when it is run centrally.  But the
fact that public inbox *can* be run by others is enough to keep people
from being worried about things being too centralized.

						- Ted
