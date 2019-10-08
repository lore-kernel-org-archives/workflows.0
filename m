Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B377C4360C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 20:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06A2221871
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 20:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730641AbfJHUdD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 16:33:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60743 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730565AbfJHUdD (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 8 Oct 2019 16:33:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A67139B297;
        Tue,  8 Oct 2019 20:32:58 +0000 (UTC)
Received: from redhat.com (dhcp-17-153.bos.redhat.com [10.18.17.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FC3D1001DC0;
        Tue,  8 Oct 2019 20:32:51 +0000 (UTC)
Date:   Tue, 8 Oct 2019 16:32:49 -0400
From:   Don Zickus <dzickus@redhat.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008203249.olm2g2qosflcguuk@redhat.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 08 Oct 2019 20:33:03 +0000 (UTC)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 08, 2019 at 03:05:27PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Oct 08, 2019 at 01:39:02PM -0400, Don Zickus wrote:
> > Regardless, I think what you wrote re-enforces the idea that emailing a
> > patch series (and their vX followups) is messy for the maintainer and a
> > more evolved idea is to let a forge take git-push as input.
> 
> I'm pretty opposed to the idea of forges, because this approach makes it
> very easy to knock out infrastructure critical to the project's ability to
> quickly roll out fixes. Imagine a situation where there's a zero-day remote
> root kernel exploit -- the attackers would be interested in ensuring that it
> remains unpatched for as long as possible, so we can imagine that they will
> target any central infrastructure where a fix can be developed and posted.
> 
> Currently, such an attack would be ineffective because even if kernel.org is
> knocked out entirely, collaboration will still happen directly over email
> between maintainers and Linus, and a fix can be posted on any number of
> worldwide resources -- as long as it carries Linus's signature, it will be
> trusted. If we switch to require a central forge, then knocking out that
> resource will require that maintainers and developers scramble to find some
> kind of backup channel (like falling back to email). And if we're still
> falling back to email, then we're not really solving the larger underlying
> problem of "what should we use instead of email."
> 
> We also shouldn't forget trigger-happy governments that like to ban troves
> of IP addresses in their chase after "the safe internet." Github has already
> been banned a couple of times in China and Russia, and chances are that this
> will continue.
> 
> This doesn't mean that forges are entirely out -- but they must remain mere
> tools that participate in a globally decentralized, developer-attestable,
> self-archiving messaging service. Maybe let's call that "kernel developer
> bus" or "kdbus" -- pretty sure that name hasn't been used before.

If we flipped it around and used today's git-pull-request emails as trigger
for forges to run their services, does cover some of your concerns?

git-pull-request emails can skip the patch-translation layer (like
patchwork), run the automated tests, and utilize the current maintainer
workflows.

The email issue is hard to resolve as some folks feel like it should be a
primary vehicle while others feel it should be a secondary vehicle.

Cheers,
Don
