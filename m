Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4209ECE587
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 15:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7982120854
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571066725;
	bh=NtpBmsd3u20i6bTpRD4WSFK6TMXGIYedng0qjhG55d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OlBoAz9Gv8jI0w4OWZPaUfIHuUKVRyi83odsoIXLbB57MFpJL7E6UrKg7I/zo4yde
	 0uLEQzQN/xAqZE4EtUjT2pVSKf58N5hizGPiNV72p53UYjl8iqV9/BmgnLCNmSVRSN
	 kjeAS0X/+sBPcT6izX+ElrLWF353Z2TIjKYx0Y7Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387485AbfJNPZZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 11:25:25 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45331 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387483AbfJNPZZ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 11:25:25 -0400
Received: by mail-qk1-f196.google.com with SMTP id z67so16196170qkb.12
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FBY10wPrgvazSW//Afns9f1aE4zaZAXgfD/210S85TY=;
        b=hvSm5aNrqYljs7wRnpEH7byK/3X7pFG1bNxyJUa3ZRCah7F2oebQKLhdsaBXNBPmM5
         ebsU8jYHwkSoI2H7pLqBx/Ca1SM4t2EjTlnXjSl2xbGUw13jZDOgtSIOhgOiGjYLktTH
         kFqU5+Mg9OLaJzlM5+UC/NXVOl05c/YrEhYOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=FBY10wPrgvazSW//Afns9f1aE4zaZAXgfD/210S85TY=;
        b=ksr3evozyGd/eWB+VJDpjBKC0eC8fr+mv/ldm91hE22YqnBn2TmiEpcv+IHFNZ/95W
         mS6j5Phj196XDJSMQKL/wJEgnjLkQnAvneH1JHkjnsLjh/aUuTfFdqmm7sX5te0MGS70
         gGkslrFBrDUGb3He0PbVfAp0LcotvumzMbL/U+Ys23fgIx51KQHP4rMDl/0F4kpbws51
         6DFKf6XIFZ/HJLjUxnq9VEk+g1+tLZ/fVGYphfWVW7KZ3o9K9nLT4li3Dejq0HHk7zcJ
         RN4i967+y/bWDrodb4Z9CSMxVr+gQiKr6cFQSiPdzukBXq9nLazokyzwt/xNGPpPfxXo
         f7qw==
X-Gm-Message-State: APjAAAWSEWLX5sUPTvHenbmy34rsyEcMpB/SzgAjp04VY8FpoHRsPDdX
        5COhJGg4TuxvKqyAKWIalTaimg==
X-Google-Smtp-Source: APXvYqzZ2XhMdol2/u3foZG2rI9AnlZW2hzbTjL6X/vwqMnAFYNQ3NX6MZ6+/lua646Cy9Y0XmcQEA==
X-Received: by 2002:a37:a6d0:: with SMTP id p199mr31076014qke.177.1571066722463;
        Mon, 14 Oct 2019 08:25:22 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id r7sm8631494qkf.124.2019.10.14.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 08:25:21 -0700 (PDT)
Date:   Mon, 14 Oct 2019 11:25:19 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014152519.s3skk4w6o6lzcjby@chatter.i7.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Airlie <airlied@gmail.com>, David Miller <davem@davemloft.net>,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
References: <20191011174719.16e997f5@gandalf.local.home>
 <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
 <20191011190009.6ee15756@gandalf.local.home>
 <20191011170839.75c52ad3@hermes.lan>
 <87lftotdv8.fsf@dja-thinkpad.axtens.net>
 <874l0bk3qb.fsf@toke.dk>
 <20191014122637.GB5564@mit.edu>
 <20191014104132.76b19507@coco.lan>
 <20191014135358.GF5564@mit.edu>
 <20191014112859.4174e3b8@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191014112859.4174e3b8@coco.lan>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 11:28:59AM -0300, Mauro Carvalho Chehab wrote:
>Yeah, our current security model is based at the maintainer for
>him to do his duties, properly reviewing the patch.
>
>Yet, at the example that Daniel gave:
>
>Instead of:
>
>	if ((permissions == allowed) && other_stuff) {
>		do_things();
>	}
>	do_more_stuff(permissions);
>
>Patch was maliciously modified to:
>
>	if ((permission == allowed) && other_stuff) {
>		do_things();
>	}
>	do_more_stuff(permissions);
>
>I suspect that a change like that might sleep though the maintainer's
>review.

I submitted a proposal to the git list that would address this, but it 
saw little uptake in the discussion:

https://public-inbox.org/git/20190910121324.GA6867@pure.paranoia.local/t/#u

To summarize it in brief, I suggested using minisign signatures and 
git-tracked TOFU (trust on first use) databases. TOFU is not perfect, 
but it's better than nothing at all, which is what we have right now.

-K
