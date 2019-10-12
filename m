Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D528AC47404
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 00:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC43A2190F
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 00:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20150623.gappssmtp.com header.i=@networkplumber-org.20150623.gappssmtp.com header.b="ZQtl5xXp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfJLAIs (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 20:08:48 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44948 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfJLAIs (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 20:08:48 -0400
Received: by mail-pg1-f195.google.com with SMTP id e10so2676660pgd.11
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nlHxzOoGDuVCuHvAWLB4R6akjvFetj+J2eRp1ekgmyQ=;
        b=ZQtl5xXpSUJQSivBAbD4rmpNTVfPa8tLQ3iTXBFv5Mo2zSUFIYIuaNeW53oRkAxDLR
         E0BA8LafLykybsLv4TzUf3aVZGXGa1ZVAy+/3W3wLauznXleE3VPpZA67aL/bwoesvH3
         BlkqzRGmj6ZEiUJy6UWuwyhyHHztq5ac6ksI94/CR6Erl9S3qoDtxzGdpD0gT7IqN3JP
         ZmzrVeDES+88t5f1rbMHXd8gwCYxhuvILE+Pg5eqfiEzIQOeOHQKseuQbFsWwNs8IPf+
         9ZCRo6j/ZVgltywjcr6qgK1lz3+F2/mWztRSgxNV5TaNTR1AT8N3gIuIJJZVplBFuPrF
         G0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nlHxzOoGDuVCuHvAWLB4R6akjvFetj+J2eRp1ekgmyQ=;
        b=esDTVyIV0LmfZm3aazaXX15VlqsyP3nzo0CmnDHLhUKqIVktKsuX5MsML6c0B2850K
         52aqxGYdIG23CRDEyoVOal+UrrsJ+h1NFbhpbQgCIaHGi3HqRKAJZFDw7+9iOFeXrdGr
         QRf4+IJ1mg/3GuM3paQ2SjDKNwquMjRiiSHJ0ZtUEerTuz0zIQGUGT83TKJq7LzdwMfq
         PtTeE/R4h9btA5l0KRSRKPjRBusOvcbaVXXPEgfQIDh/kZBuwv169bp+4LxfRGBcKqHg
         Cvn3s87FF120akCynaGXtzY2vJUmOOQ2hRQiO8haCqQzn8Pmk/CJ+vne//xHxg2qvakC
         t3Qw==
X-Gm-Message-State: APjAAAXkRtmWfM00sMmpXeBh/D7DYdB45c5C8REzcTDkzvIwQX72MCRn
        MIj00cwABXtpjHtOwQk9Gka7tA==
X-Google-Smtp-Source: APXvYqzAujU/jt7hw1ZP7pkNq9k6sqoaHDPlJj9tHo11hbOqrmBPsu1rm5IgqdQqjXbb+3fqvUiv7w==
X-Received: by 2002:a63:f923:: with SMTP id h35mr20214969pgi.323.1570838926442;
        Fri, 11 Oct 2019 17:08:46 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id r11sm9333116pgn.67.2019.10.11.17.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 17:08:46 -0700 (PDT)
Date:   Fri, 11 Oct 2019 17:08:39 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011170839.75c52ad3@hermes.lan>
In-Reply-To: <20191011190009.6ee15756@gandalf.local.home>
References: <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
        <20191011155949.145f0f7d@coco.lan>
        <20191011.121153.1410013220730418292.davem@davemloft.net>
        <20191011141909.1ccb58b3@hermes.lan>
        <20191011174719.16e997f5@gandalf.local.home>
        <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
        <20191011190009.6ee15756@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 11 Oct 2019 19:00:09 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> > > > As someone who has to deal with a corporate busted mail server.
> > > > I agree mailing patches is a barrier to entry for many people today.    
> > >
> > > Hmm, and I wonder what company fosters so many issues with doing that
> > > today? :-/
> > >
> > > /me notices that Stephen uses his personal email account ;-)    
> > 
> > Your current employer also defaults to a crappy link replacer on most emails :-)  
> 
> Yes, because they use Stephen's employer's crappy email servers.

Yes, my life is too short to fight with corporate stuff.
There is a security first mindset which is good but gets in the way.
The current generation of Internet standard mail protocols does not have enough security to be allowed.

It does bring up that any new workflow has to have security protocol
and threat model as part of its design.
