Return-Path: <SRS0=f2kX=4M=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4A6C11D2F
	for <workflows@archiver.kernel.org>; Mon, 24 Feb 2020 18:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 820A720732
	for <workflows@archiver.kernel.org>; Mon, 24 Feb 2020 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582567853;
	bh=AR8lzojzLC/iu7C1qwtUJLELA8Xjzw+j2iUYekZJvuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I+K/2+CszdPjlVIfF13Yjb/ERaC5XvwkJ96JM8bpZRoWhsEE1HTUsWWZN883sYoLL
	 jxxcCRTHLhvy+UBxUz3pGaqlJgkFjeP3KyKaQbVyt73iaVXWnliCqUIKtkCNd/Ri+L
	 bgG+/xopmpPb39a5wXlwdlCSBr3EvVkj/0Lvimzw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgBXSKx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 24 Feb 2020 13:10:53 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:40973 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBXSKx (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 24 Feb 2020 13:10:53 -0500
Received: by mail-wr1-f51.google.com with SMTP id c9so11534080wrw.8
        for <workflows@vger.kernel.org>; Mon, 24 Feb 2020 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=A2XOqSmt8889LTJio0SV0Bhl3GvyOamNgXDuAGz481E=;
        b=H7hkSK1OUktsWbVKRpzMXn0NOxdm20LIcPjeKorJQKTPEoLtrutfheFwYFbkPFYLEO
         UALXbq5pICenxhg2PVA5/XSjFG2AXs366d0OdeAWzTRZVjLj35fMUNjRinvcJjwQa9Bk
         hOY9AVLI7Ix/2GWu/82gJCAkhWtHMc/Abn4q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=A2XOqSmt8889LTJio0SV0Bhl3GvyOamNgXDuAGz481E=;
        b=TAVQQNxApFvaLcexUDl1hN2lr6G+xVG/lwa20LE5IKvhszgkH2/wxs0epQ2y4nxOH+
         l+KeBdIGBpJpGwgLsMKcdZFpPe3+63MsticwWFIt/vWJhirH45QShLRrACH/znoSzQDG
         MA3WT1Wqacphxof3R+y5Xs0sNyeXbaEk2gZ3O0GXb5Cbeyx6WlAIrcLsPam5UPI1/Xy8
         SXTBnXt5cI0TrKbbHL7/aPiCzZ07r7ybHxO/fI85x2NItwh+6HCWgnULjHRnd/cMZHLG
         te/zu/ycLV/xf5aVjDvRler9o+rfUuXq3pwT0sk7568b5mmENsHR74U/hm+9hrapRuxk
         PiZw==
X-Gm-Message-State: APjAAAVxCyxyS/tImTgQcFD93h24Nqe2oScRfBQH0xA9/Nu+e/xZ+gLN
        8Xo2i7GzCJZl6rbvHKet1NL2JSAd7s0MUA==
X-Google-Smtp-Source: APXvYqy2aeP1GUr93E58mlX3ANKXBa73iwfn9qt0Nw1tsfSx0+LiWXaMK83hTp+nSDj7Z+LY5H4gcQ==
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr65121843wrx.330.1582567851006;
        Mon, 24 Feb 2020 10:10:51 -0800 (PST)
Received: from chatter.i7.local (tor-exit-16.zbau.f3netze.de. [185.220.100.243])
        by smtp.gmail.com with ESMTPSA id l132sm281074wmf.16.2020.02.24.10.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:10:49 -0800 (PST)
Date:   Mon, 24 Feb 2020 13:10:42 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
Message-ID: <20200224181042.h4q3umrjqxujkxwt@chatter.i7.local>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, workflows@vger.kernel.org
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
 <7hwo8p9db1.fsf@baylibre.com>
 <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
 <CAL_JsqLEA=LYdB_21rWsA-LXO+f1ZPga4j6wn6bn5gFrhxFhhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLEA=LYdB_21rWsA-LXO+f1ZPga4j6wn6bn5gFrhxFhhw@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Feb 24, 2020 at 11:39:02AM -0600, Rob Herring wrote:
> It may be easy enough unless you have something like this series:
> 
> https://lore.kernel.org/lkml/cover.1582361737.git.mchehab+huawei@kernel.org/
> 
> It backtraces if you give it patch 2 msgid:
> 
> 83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org
> 
> Presumably because patch 2 and and the cover letter aren't on the same
> list? Arguably, that's bad practice, but it's quite common to only
> have 1 or a few patches of the whole series. If you start with the
> cover letter, then it can find everything.

There is currently no way to reconstitute a single thread from multiple 
sources -- this is something that we would like to change in the near 
future. If a message is sent to multiple mailing lists, then there is no 
guarantee from which list you are going to get the thread, unless you 
specify -p projname. E.g.:

./get-lore-mbox.py -o/tmp -a -p linux-doc \
  83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org

However, this will only pick up follow-ups from linux-doc, so if there 
are any trailers sent to another list, get-lore-mbox will know nothing 
about them:

> Also, it didn't pick up 2 out of 3 Acked/Reviewed-by tags:
> 
> https://lore.kernel.org/linux-doc/CAHLCerP_UW-6CdaOziHTY01cD_6Ou4h0Jj6mOJKj60P4GL9H=w@mail.gmail.com/
> https://lore.kernel.org/linux-doc/41551c09-5443-4980-9c6f-6bc7f48aa356@www.fastmail.com/

Changing this behaviour requires significant rewrites of the backend in 
order to be able to mux results from different sources. This is work 
that is planned and will be happening.

For the moment, I don't have any good solutions other than fixing the 
backtrace (which is now fixed).

-K
