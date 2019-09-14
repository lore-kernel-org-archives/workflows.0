Return-Path: <SRS0=pxZg=XJ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E02C4CEC9
	for <workflows@archiver.kernel.org>; Sat, 14 Sep 2019 16:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D2AB20717
	for <workflows@archiver.kernel.org>; Sat, 14 Sep 2019 16:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="Uoxea1/W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfINQyj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 14 Sep 2019 12:54:39 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:53184 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727737AbfINQyj (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 14 Sep 2019 12:54:39 -0400
X-Greylist: delayed 555 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Sep 2019 12:54:38 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1568479522; bh=1mz/c0UP5vE37h/fSufgeIK+gCJW2vVf65KflMQsNjs=;
        h=Date:Cc:Subject:From:To:In-Reply-To;
        b=Uoxea1/WYUDVGXLHezQDRdp3LlQsNFUF1WDtGi5y0lQBKZtZQbZggLFIReLSNN2hj
         RuIVZxHkzUJpEhmEx+IhW5CQ/lSAl2+5nKrGLJKn5tZ4Y/V6DTAJWJXlpvEDSP5EVy
         DLCOfzFnt+gy7EGkOh2sBrzj55BPviFSMarkFD1I=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Sat, 14 Sep 2019 12:45:22 -0400
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: New list for people to share maintainer workflows
From:   "Drew DeVault" <sir@cmpwn.com>
To:     <workflows@vger.kernel.org>
Message-Id: <BWZVL56NCQCT.37ZPAQOP2BDSN@homura>
In-Reply-To: <20190913073849.GA15965@mit.edu>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Ted! Long email incoming.

I'm very interested in solving these kinds of problems. By way of
introduction, I'm the maintainer of two relevant pieces of free (as in
freedom) software:

<begin introduction>

https://sourcehut.org/
https://aerc-mail.org/

Source code:

https://git.sr.ht/~sircmpwn?search=3Dsr.ht
https://git.sr.ht/~sircmpwn/aerc

AGPL and MIT licensed, respectively, and the former is also available as
a hosted service. Sourcehut is a software hosting platform like Github
and Gitlab, but it prefers the mailing list workflow. We host git repos,
mailing lists, and continuous integration using KVM. Each of the
services like git repos and bug tracking are standalone and can be used
ala-carte and integrated with external services.

Here's an example archive for a development mailing list:

https://lists.sr.ht/~sircmpwn/sr.ht-dev

Note that patches are recognized like patchworks, and feedback written
in the usual style of mailing list patch review is interpreted and shown
inline to make a comfortable web interface. Here's an example of a patch
with some feedback:

https://lists.sr.ht/~sircmpwn/ctools/patches/8134

Over time this will evolve into an interface similar to Gerrit. Feeding
emails into automated testing and sending the results back to the list
is another feature I have planned before October. Automated testing of
kernels seems feasible to me given that the CIs run on KVM rather than
containers or something similar. Here's an example build of a Wayland
compositor on Alpine Linux: https://builds.sr.ht/~sircmpwn/job/89260
Click "view manifest" to see the YAML which triggered this, though it
has been programmatically modified and the pretty YAML formatting didn't
survive. The needs of Linux in particular are probably not addressed by
the upstream software, but it might make for a good jumping off point
for a custom solution.

Things like tracking bugs can also be done over email and doesn't
require an account. With an account, though, you can use web-based tools
to do the same tasks that can be done with email. For example, you'll
soon be able to prepare patches on the web as well, so you needn't
configure git send-email locally. I have written a nice tutorial for
those who want to, though: https://git-send-email.io

This plays into a general theme with all of this software, which is
building on top of what people are already using (email), rather than
trying to build a new system from the ground up. We can improve the user
experience without making people drop workflows that they're already
productive with.

aerc is a new mail client I'm working on that aims to replace mutt and
have first-class git integration. The git-specific features haven't
materialized yet so there's not much to introduce, it's just a better
mutt right now.

With introductions out of the way...

<end introduction>

Problems I've faced with trying to advanace email-driven development
into 2019 include:

# Identifying different versions of the same patchset.

Like you mentioned, no one likes Change Ids, including me. So far the
best option I've considered is checking the date - it gets perserved
even through rebases and is /basically/ unique. Enough rebasing and it
*will* get lost, though, and then manual intervention is required.

I've considered a few ways to address this. One route might be to make
git send-email smarter, and utilize heuristics on the reflog to try and
identify that a patch is a -v2. Then we can add an email header like
`Superceeds: <commit or message id or something new>`.

Less desirable options would affect people's workflows, which is
something I'd like to avoid. One example is adding new commands which
explicitly track the evolution of a feature in your local git
repository.

# Pulling down patches to use locally

On the web archives I have a copy-pasteable command which curls down a
patchset and pipes it to git am -3. This seems like a fairly comfortable
solution to me, but this does seem attractive:

> "it should have a web interface, and it should be easy to pull down
> patch series via a git pull, and we should be able to easily view
> diffs between the v49 and v50 version of the patch series"

But, I think this could end up being problematic. We have a similar
example already in GitHub: every pull request is available for fetching
from the remote. For one of my bigger projects, however, the result is
this:

	~/s/wlroots > git ls-remote | wc -l
	From git@github.com:swaywm/wlroots
	1255

At the scale of the Linux kernel I imagine this would get seriously out
of hand. Another problem would be mapping mailing lists to repos. What
git repository do patches on LKML belong to?

Solvable problems, I think, but something to consider.

# Storage medium

> "it should be like patchwork, in that it is fully compatible with
> e-mail review, except it should work off-line and use something
> like git as its transport layer"

I'm not sure how much this was example idea vs actual idea, but let's
assume actual. I just wanted to mention that mail spools work offline
and are already pretty distributed. There's no doubt thousands of copies
of LKML spread about the internet. Maybe this one doesn't need solving.
