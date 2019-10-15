Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD3C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 351D520872
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571168188;
	bh=HNPlCoLk1rotdglsyk3lvh59Am0ajC4seGHd7YiY1H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=x0HNFz0hA9fp85xlF2+JCnIG3M5LHbXRiMZN5ZguYqqYCxB6PUy1nAFvRGmE+xtVL
	 opc8VZCvXc+aDCapKbzdaFL+TqCFPzRqLgpmHCX5koEPaRBQJxM4ZWyJQh8NKvWzVr
	 90y3jm2my/f8o5Kw1RVPMewgdqeEA+hAx0FkVWUc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfJOTg2 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 15:36:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730316AbfJOTg1 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 15:36:27 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 044F220663;
        Tue, 15 Oct 2019 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571168187;
        bh=HNPlCoLk1rotdglsyk3lvh59Am0ajC4seGHd7YiY1H0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v0vpJ6lT3XUiMtDsdSegjAGZ/l2WCdJBk6CbfkdQ7lCar+13e3wHeHPVdoEzzCutW
         xl/RPwmMS7ezYyEnn+MBsc380meQPa9hv0q8tJbjAi5venjINGvDg+29Bsmz+oemYy
         /WXuH5BhIj2hiheU8Ztq33sASGtF3VukyZ+ihrOE=
Date:   Tue, 15 Oct 2019 21:35:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191015193507.GC1152701@kroah.com>
References: <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015183752.GB5473@chatter.i7.local>
 <CAFQ2z_OyzfGDKQgzWNGoj4dpx-15B=kZkmOvJr9LU5AjfK=y0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFQ2z_OyzfGDKQgzWNGoj4dpx-15B=kZkmOvJr9LU5AjfK=y0A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 09:15:27PM +0200, Han-Wen Nienhuys wrote:
> The question about China is a good one. If access from China (and
> Iran, North Korea, etc.) is a requirement, that would be useful to
> document.

China is NOT the same as those other two contries according to most
governments, so the "rules" are different.  And of course we accept
contributions from China, why wouldn't we?

thanks,

greg k-h
