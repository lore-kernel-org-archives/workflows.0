Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C5EC433FE
	for <workflows@archiver.kernel.org>; Tue,  8 Dec 2020 18:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D4F423B6B
	for <workflows@archiver.kernel.org>; Tue,  8 Dec 2020 18:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730855AbgLHSMZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Dec 2020 13:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730468AbgLHSMZ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 8 Dec 2020 13:12:25 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DECC061749
        for <workflows@vger.kernel.org>; Tue,  8 Dec 2020 10:11:44 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id s6so917727qvn.6
        for <workflows@vger.kernel.org>; Tue, 08 Dec 2020 10:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=IwcPTu2U1wMr+DgrLIGXColkZTg1zgpTSexaEU45oIg=;
        b=bR2YHwVXoMbTng9ydgiLRHl/r0PrZdp8Ta3aja1ZJcRvXrbK8dfEFlKKRSy+fJ5kVq
         tmFZ6JaEVQ7nT2voaF9iRJ1wXZRqov2+j2GPZsaeSzDf+e4gyAXTBhhXmV3X4rcoibvZ
         X72Q/3rJPbYU40gMabR/2D03pA1lAWyoUC2/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=IwcPTu2U1wMr+DgrLIGXColkZTg1zgpTSexaEU45oIg=;
        b=oROgjRpfKAFZhkw/Pevss1kHlT9CYn9o0YVL8gODUyZWF4yHsRitSVxE1sT6w0/a+R
         HaAMGdelr32NVsxMF35eCyr0wyImNaM/r8LelFdVkH9b70FWTLgYwRXrjmF2/HcSkRhO
         m7Dcj3qrLP6bY7/nr2LbTDswc4O7tkVRqY409x9xPSljzbnC/T3i1f0Yj9YLVAWmfqiq
         HuwPV9jFW01fdJ7+tuvCaXZL78MuNSomOAKBiUN/HuxwzzV7D+7I2lb/HcO+ipiUPq7o
         RzOKIMVCF9mL7aB6paHshotqHoJTK06pz1QlDmqQcMToWlI44OBeMzz/43nsYwT55YHm
         JmlA==
X-Gm-Message-State: AOAM533AXGtYvblpiwfyRYo+GM9WGDjAFHYOlQAKSQ7zpsiltkwk8UJ6
        99NoGftYC62720YgojGHrhKq3hFV4RuHKSlh
X-Google-Smtp-Source: ABdhPJyYuWL5emtVTWHgnv731ibZBep0AUewnwRwqhtkuFAqtS9+p5302ODphDEZrtunZwEg3a2M1g==
X-Received: by 2002:ad4:4761:: with SMTP id d1mr15212714qvx.12.1607451102982;
        Tue, 08 Dec 2020 10:11:42 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id u26sm2000489qke.57.2020.12.08.10.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 10:11:42 -0800 (PST)
Date:   Tue, 8 Dec 2020 13:11:40 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20201208181140.2ysin3tgqithdmel@chatter.i7.local>
Mail-Followup-To: Eric Wong <e@80x24.org>, workflows@vger.kernel.org,
        meta@public-inbox.org
References: <20201126194543.GA30337@dcvr>
 <20201128223457.GA31347@dcvr>
 <20201205200717.GA7923@dcvr>
 <20201208140111.3lxecf42d6ooskeb@chatter.i7.local>
 <20201208180232.GA20637@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208180232.GA20637@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Dec 08, 2020 at 06:02:32PM +0000, Eric Wong wrote:
> > So, are things to the point where we only need a single xapian db 
> > for all lists, or do we still need to keep individual list indexes?
> 
> Only indexlevel=basic (sqlite) for individual lists.  This saves
> a bunch of FDs and provides ~60G overall space savings (not compacted).
> 
> For all of lore:
> 
> 	git + {over,msgmap}.sqlite3:		51G
> 	extindex "all"	over.sqlite3 + Xapian:	193G

Sweet, now I'm getting excited all over again. :)

-K
