Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6D5C4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 19:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1987820863
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 19:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbfI0Tqa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 15:46:30 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:54286 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725802AbfI0Tqa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 27 Sep 2019 15:46:30 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x8RJkN5C005769
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Sep 2019 15:46:24 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id E8A2E42014C; Fri, 27 Sep 2019 15:46:22 -0400 (EDT)
Date:   Fri, 27 Sep 2019 15:46:22 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org
Subject: Re: script to check "Fixes:" tags
Message-ID: <20190927194622.GB10468@mit.edu>
References: <20190926195143.GA1742392@kroah.com>
 <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
 <20190927180133.GD1802011@kroah.com>
 <CAMuHMdWK8cU56c0B7dUmezCZmCfV6kmFMeqVpzhTvKzSiQTRYA@mail.gmail.com>
 <20190927183557.GA1805907@kroah.com>
 <CAMuHMdXFODjJpgbH==PLWsU1KL-7oDXS_u_wMZ99v-KEnt_QKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXFODjJpgbH==PLWsU1KL-7oDXS_u_wMZ99v-KEnt_QKw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Sep 27, 2019 at 09:00:37PM +0200, Geert Uytterhoeven wrote:
> > I just noticed that checkpatch can handle a git range, so I'll revisit
> > it and see if I can "just test one thing" with it or not, next week.
> 
> That assumes the patches have been applied already...
> Which is fine for maintainers taking pull requests.

Or for maintainers who pull patches into a git repository for review
purposes.  For complex patches, or long patch series, it can be easier
to use Gerrit than reviewing patches in your inbox, because there's
not enough context in e-mailed diff.  So what I do get around this
problem when the patch series is sent via e-mail is to apply them onto
a temporary git branch.  That means I can look at the patch series in
the context of a whole tree.  It also means I can launch a smoke test
while I'm looking at the changes.

With modern review systems, the automatic build test, static code
checker runs, running uninit tests, etc., happen in parallel and
automatically the moment the patch(es) are submitted for review, even
before a human starts to pay attention to it.

Right now we're trying to simulate this by having the zero-day bot try
to guess what commit against which the patch or patch series are
applied.  Unnfortunately, sometimes the zero-day bot gets it wrong,
and recently it can take 4-5 days before the zero day bot goes through
its backlog, and today, the zero day bot doesn't know when a patch
series has been superceeded by a newer version, so it wastes CPU time
and generates noise on the mailing list.

So I can imagine a scheme where (optionally) a patch submitter would
push their patch series to some review queue, and the system would
e-mail the patches to the mailing list on behalf of the user.  In
parallel, build tests, regression tests could be run, checkpatch,
etc. could be run, etc., against that temporary git branch.

This has a number of advantages; newcomers won't have to fight with
their corporate e-mail systems to avoid white space damaging.  (This
can be quite challenging, and if their company is using Lotus Notes,
impossible.  :-)  It would also make it simpler for systems to run
tests against the branch, and could also enable some simplicity for
the test runners to be able to tell when the V20 version of a patch
series has been superceded by V21.

					- Ted
