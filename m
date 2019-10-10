Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11BEC10F14
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 12:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0D872067B
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 12:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733301AbfJJMsH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 08:48:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60354 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733288AbfJJMsH (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 08:48:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1E583190C021;
        Thu, 10 Oct 2019 12:48:06 +0000 (UTC)
Received: from hmswarspite.think-freely.org (ovpn-121-108.rdu2.redhat.com [10.10.121.108])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B262C194BB;
        Thu, 10 Oct 2019 12:48:04 +0000 (UTC)
Date:   Thu, 10 Oct 2019 08:48:03 -0400
From:   Neil Horman <nhorman@redhat.com>
To:     Laura Abbott <labbott@redhat.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191010124803.GA32022@hmswarspite.think-freely.org>
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <20191008203249.olm2g2qosflcguuk@redhat.com>
 <20191008213502.GA3591@pure.paranoia.local>
 <6da53e48-20f7-f473-ca4d-d773f1c7330c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6da53e48-20f7-f473-ca4d-d773f1c7330c@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Thu, 10 Oct 2019 12:48:07 +0000 (UTC)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Oct 09, 2019 at 05:50:36PM -0400, Laura Abbott wrote:
> On 10/8/19 5:35 PM, Konstantin Ryabitsev wrote:
> > On Tue, Oct 08, 2019 at 04:32:49PM -0400, Don Zickus wrote:
> > > > This doesn't mean that forges are entirely out -- but they must remain mere
> > > > tools that participate in a globally decentralized, developer-attestable,
> > > > self-archiving messaging service. Maybe let's call that "kernel developer
> > > > bus" or "kdbus" -- pretty sure that name hasn't been used before.
> > > 
> > > If we flipped it around and used today's git-pull-request emails as trigger
> > > for forges to run their services, does cover some of your concerns?
> > 
> > Not really, because it doesn't preserve any records. A pull request is a
> > pointer to some code in a git repository somewhere. Like any pointer, it
> > is neither self-contained nor long-lived:
> > 
> > - the repo can be gone a month later (or that branch deleted)
> > - the PR does not preserve any discussions that happened around that
> >    code such as bug reports, test success/fail matrices, or peer reviews
> > 
> > It's also pretty inefficient, because it requires that the pull-request
> > submitter hosts a 1.5GB repository on a fast permanently-available
> > connection just so they can share a few lines of changes.
> > 
> 
> I know this is an issue that Outreachy interns across projects have had in
> the past with trying to sync large git repos across laggy connections.
> 
I wonder if the alternate index features of git could be expanded here
to support this kind of workflow.  I.e. if a child tree to a parent
project could just point to the master trees object database, and the
child only stores new objects pushed to it that don't exist in the
master tree.  That would greatly reduce the storage space needed for
forks.  I expect this is what forge solutions do under the covers
anyway.  It might be nice to codify that in direct git usage

Neil

