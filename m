Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20733C4360C
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 11:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCFF021850
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570879240;
	bh=DpUXbIC7dfrzeNS4Rph6Ea9kvQmIme8vfnfnlE0Kf4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=iWvJUvCZ3vj8f2ZqItsJGVHu9KXxr3HVPxR4IQmRro1N1kL00ypufCvhgmbLAG81g
	 UW511Cik05ifs2OoU6+QcZpg8h4WER21ZltLS5AI3jQ8OTyX4gh1SDJf54cpkcf810
	 Zjel6ZQWmqmcYDu8C09/xbvq5iLzmpq4i7AYuihk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbfJLLUj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 12 Oct 2019 07:20:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60828 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfJLLUj (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 12 Oct 2019 07:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=p2ENz++6f9s9F9PcL6verwTIlrhaC1ThJ3Gic4Oaz0I=; b=EsRqzzR7+dWAZizBbEQnIb1YV
        zUvMN7nQGgr1wR90/yhnr02MACD7hEFYM0BPEpLiA9VAs4g96d2bLxMaG2clHyNcf/B3iJnMqTF3D
        ohRmJ0+GI9SiDZBzO+Eon9O1aH9DqR/xl38ThAe7DnWa5vCJrR5iyxN72XS53gtYwbO05IcUuNnq6
        mq32JixQw3B7zm2BmGJNVA31leRo7XUflcO4BzUblIC+l3tQQgGrAYizmUNR6li1TXxUqAXe8TSd3
        qhUe31Gd99cePjdjp47U3LYkFKELgECuCKZTuf9fF3+pbD/zjNR9VDueGgAV+P6jLnPjBwelEvXaP
        j1lx1U+eA==;
Received: from 177.17.141.107.dynamic.adsl.gvt.net.br ([177.17.141.107] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iJFRu-00049X-Ff; Sat, 12 Oct 2019 11:20:38 +0000
Date:   Sat, 12 Oct 2019 08:20:33 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: RFC: individual public-inbox/git activity feeds
Message-ID: <20191012082033.4a66e9b2@coco.lan>
In-Reply-To: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Thu, 10 Oct 2019 15:28:52 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:

> # Using public-inbox with structured data
> 
> One of the problems we are trying to solve is how to deliver structured 
> data like CI reports, bugs, issues, etc in a decentralized fashion.  
> Instead of (or in addition to) sending mail to mailing lists and 
> individual developers, bots and bug-tracking tools can provide their own 
> feeds with structured data aimed at consumption by client-side and 
> server-side tools.
> 
> I suggest we use public-inbox feeds with structured data in addition to 
> human-readable data, using some universally adopted machine-parseable
> format like JSON. In my mind, I see this working as a separate ref in 
> each individual feed, e.g.:
> 
> refs/heads/master -- RFC-2822 (email) feed for human consumption
> refs/heads/json -- json feed for machine-readable structured data

That sounds scary. I mean, now, instead of looking on one inbox,
we'll need to look at two ones that may have the same message
(one in RFC-2822 and the other one in JSON). Worse than that,
the contents of the human-readable could be different than the
contents of the JSON one.

IMO, the best is to have just one format (whatever it is) and some
tool that would convert from it into JSON and/or RFC-2822.

Thanks,
Mauro
