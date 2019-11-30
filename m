Return-Path: <SRS0=Im9A=ZW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49601C432C0
	for <workflows@archiver.kernel.org>; Sat, 30 Nov 2019 18:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CA342075C
	for <workflows@archiver.kernel.org>; Sat, 30 Nov 2019 18:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=that.guru header.i=@that.guru header.b="an26/h8j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfK3Sgm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 30 Nov 2019 13:36:42 -0500
Received: from qrelay124.mxroute.com ([172.82.139.124]:38171 "EHLO
        qrelay124.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfK3Sgm (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 30 Nov 2019 13:36:42 -0500
X-Greylist: delayed 1926 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Nov 2019 13:36:42 EST
Received: from filter004.mxroute.com (unknown [94.130.183.33])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by qrelay124.mxroute.com (Postfix) with ESMTPS id DCD9C12097D;
        Sat, 30 Nov 2019 13:36:41 -0500 (EST)
Received: from one.mxroute.com (one.mxroute.com [195.201.59.211])
        by filter004.mxroute.com (Postfix) with ESMTPS id 87DD33EAE1;
        Sat, 30 Nov 2019 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=that.guru;
         s=default; h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
        In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=bE4lSxPjKh/tU+StFuRyIGbipqiBlgb6M8y/MBSeNsc=; b=an26/h8jc0qGHBJf53DLSMEtxK
        Pz/PzpDCdM4zZqfXMS5OvUZLY7+x6+2REXeG07CjvaLm2MPzkGDqA4xe0m5jL17Ml8F+tQUd01yXt
        6sme9vHMeufKxjckGuoECwUoJk9s+Uawr1ZUIHhmqLdYTCMMWYQQYmOSXF/raQr53zaXskerUHtkN
        WzZ05iEKHfv0jAivgSJdWjyEf+OHJrkQcydnfP01/bwrSUe1K8liIlRxR/xQwtguVwjNddYMyfYTR
        mKSdfcapVYJ0sxTYBqOLAkp/D40Ct2IADFdv3ryGRo7FKwwCnraeBfZW4bV0Yw9grmFlSt4U5vIgX
        JICUJsHA==;
Message-ID: <30037ebd93d2949354582f472be98524d9d52ada.camel@that.guru>
Subject: Re: Structured feeds
From:   Stephen Finucane <stephen@that.guru>
To:     Johannes Berg <johannes@sipsolutions.net>,
        Daniel Axtens <dja@axtens.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org
Cc:     workflows@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        automated-testing@yoctoproject.org,
        Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 30 Nov 2019 18:36:36 +0000
In-Reply-To: <ac18c57edf7581b874399d6a4f6c1fb20c3a6543.camel@sipsolutions.net>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
         <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
         <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
         <87h83eh2op.fsf@dja-thinkpad.axtens.net>
         <223b3b048f644b4d0fd854f9e360ed6d451c8241.camel@sipsolutions.net>
         <208edf06eb4c56a4f376caf0feced65f09d23f93.camel@that.guru>
         <ac18c57edf7581b874399d6a4f6c1fb20c3a6543.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-AuthUser: stephen@that.guru
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 2019-11-30 at 19:16 +0100, Johannes Berg wrote:
> On Sat, 2019-11-30 at 18:04 +0000, Stephen Finucane wrote:
> 
> > > Somebody (Daniel Borkmann?) posted a (very fast) public-inbox git to
> > > maildir converter, with procmail support. I assume that would actually
> > > satisfy this step already, since you can just substitute the patchwork
> > > parser for procmail.
> > 
> > What do you mean "substitute the patchwork parser for procmail"? From
> > reading this thread, I got the impression that we'd be changing what
> > feeds things into the 'parsemail' management command, right?
> 
> Yes, that's exactly what I meant. I was looking at it from Daniel's
> tool's POV, so instead of calling procmail it can call patchwork.
> 
> johannes

Ah, then that I have no issues with :) I've managed to configure
getmail to feed into a patchwork instance exactly once, and found
configuring postfix so daunting that I actually suggested just using an
email-as-a-service provider to take the hassle out of things [1].
Anything that lets one avoid working with those tools is a good thing
in my mind.

Stephen

[1] https://patchwork.readthedocs.io/en/latest/deployment/installation/#use-a-email-as-a-service-provider

