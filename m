Return-Path: <SRS0=+Bhr=XM=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1919C4CEC9
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 21:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA032216C8
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 21:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfIQV6e (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 17 Sep 2019 17:58:34 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:51236 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbfIQV6e (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 17 Sep 2019 17:58:34 -0400
Received: from 79.184.255.25.ipv4.supernova.orange.pl (79.184.255.25) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 6f86e16ca8b7f566; Tue, 17 Sep 2019 23:58:31 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Date:   Tue, 17 Sep 2019 23:58:30 +0200
Message-ID: <2608348.dCUkSTB59S@kreacher>
In-Reply-To: <875zlwzbxv.fsf@intel.com>
References: <1811089.yxvLMk49Ug@kreacher> <875zlwzbxv.fsf@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Friday, September 13, 2019 1:13:16 PM CEST Jani Nikula wrote:
> On Fri, 13 Sep 2019, "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
> > Hi All,
> >
> > During the Maintainers Summit session yesterday I started to create a wish list
> > for the new kernel development collaboration platform to be created (and to
> > replace the multiple pieces of tooling in use today).  I also asked Bjorn,
> > Jiri, Greg and Shuah for input and here's the reslut:
> >
> > 1. Compatible with e-mail
> >
> >   (a) E-mail send to it stored and included automatically; appears as part of
> >       the normal flow.
> >
> >   (b) Automatic e-mail responses
> >       If e-mail is sent to it, the sender will get all responses to it in the
> >       given thread by e-mail.
> >
> > 2. History tracking
> >
> >   (a) Should be able to track revisions of a given patch series (or patch) down
> >       to the initial submission.
> >
> > 3. Integration with git
> >
> >   (a) Should be able to create git commits from patches (or patch series)
> >       tracked by it if pointed to a git branch (either locally or remotely).
> 
> As I wrote in [1], I think git send-email and am are a lossy method of
> transmission, and reliably regenerating commits from patches, with the
> right baselines, as well as tracking various patch and patch series
> versions, is very difficult.

Assuming that git is used to generate patches in the first place.

Some people use different methods, like quilt, however.

> I think we should have a git push based mechanism to contribute, which
> would in turn send the patches to the right lists and maintainers for
> review.

Alternatively, one could point the change submission mechanism to a
git branch exposed from somewhere and a tree to merge it on top of.

> Maintainers could, at their choosing, still use the emailed
> patches (which would all be sent using the same pipeline, without the
> typical issues) and their exact existing workflows, or switch to using
> the commits from a branch directly.
> 
> There are more contributors than maintainers by several orders of
> magnitude. It would make the maintainers' lives so much easier if the
> patches came in the same way, every time.

I guess you mean a consistent view of all patches regardless of the source.

If so, then I agree, that should be one of the goals.

> When we have technical issues
> with patches, as maintainers, the problems rarely are in the receiving
> end. IMO solving *all* the other items in this email would become much
> easier if had this first.
> 
> BR,
> Jani.
> 
> 
> [1] http://lore.kernel.org/r/87lfv3w3v6.fsf@intel.com
> 
> 
> >
> >   (b) Link tags pointing back to it should be added automatically to git
> >       commits created from patches tracked by it.
> >
> > 4. Distributed
> >
> >   (a) Support for running offline.
> >
> >   (b) Support for batch updates.
> >
> >   (c) CL-frendly.
> >
> > 5. Patchwork-like features
> >
> >   (a) Delegation support.
> >
> >   (b) Support for bundles and patch series manipulation.
> >
> >   (c) Smart mbox (download all selected patches).
> >
> > 6. Easy to set up (especially for local installations)
> >
> > 7. Bug tracking support
> >
> > I guess there are more items to be added to this list, so please extend it if
> > you have any ideas and we'll see where this goes. :-)
> >
> > Cheers,
> > Rafael
> >
> >
> >
> >
> 
> 




