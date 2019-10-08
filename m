Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B01C35280
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 16:43:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE4AD21721
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 16:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbfJHQnX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 12:43:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48922 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727876AbfJHQnX (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 8 Oct 2019 12:43:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id F287F30BBE64;
        Tue,  8 Oct 2019 16:43:14 +0000 (UTC)
Received: from redhat.com (dhcp-17-153.bos.redhat.com [10.18.17.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EB505C1D4;
        Tue,  8 Oct 2019 16:43:10 +0000 (UTC)
Date:   Tue, 8 Oct 2019 12:43:09 -0400
From:   Don Zickus <dzickus@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Axtens <dja@axtens.net>, David Miller <davem@davemloft.net>,
        sir@cmpwn.com, nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008164309.mddbouqmbqipx2sx@redhat.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007211704.6b555bb1@oasis.local.home>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 08 Oct 2019 16:43:23 +0000 (UTC)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 07, 2019 at 09:17:04PM -0400, Steven Rostedt wrote:
> On Tue, 08 Oct 2019 10:00:03 +1100
> Daniel Axtens <dja@axtens.net> wrote:
> 
> > Non-email systems have an easier time of this: with gerrit (which I'm
> > not a big fan of, but just take it as an example) you push things up to
> > a git repository, and it requires a change-id. So you can track the base
> > tree, dependencies, and patch revisions easily, because you build on a
> > richer, more structured data source.
> 
> I believe we all want a new system that can handle this, but still be
> able to work with email. Patchwork requires to read all emails and
> figure out what to do with it. This workflow doesn't need to do that.
> But it should be able to send out emails on comments, and a reply to
> one of those should easily be put back into the system.
> 
> As for adding patches, we can push to a git tree or something that the
> tool could read. It's much easier to know what to do with a branch then
> email. A rebase could be a new version of the series (and we should
> probably archive the original version).

Thanks for the thoughts.  Your thoughts here and your bugzilla example make
sense and ties into some of the work we are experimenting with, with a small
group at Red Hat.  My only sticky point is the initial patch submission.
Pushing to a forge like github, gerrit, or gitlab makes a ton of sense like
you said above.  But what do we do with folks who still email patches
initially (instead of the git-push)?

What should be the expectations there?  Leverage patchwork to create a 'git
push'?  Reject the patchset?  Something else?  Curious.

Thanks!

Cheers,
Don
