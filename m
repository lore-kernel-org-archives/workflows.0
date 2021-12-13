Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AAEC433F5
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 22:57:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234676AbhLMW5I (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 17:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240451AbhLMW46 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 17:56:58 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D548C061751
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 14:56:58 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso15793064pji.0
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c79j5BNX5JvuSaCQC3hnBE70FcREHVJqXkpTkSfEQi8=;
        b=N4wtqbZG/Kj6ocV1i90Wv9dtsav6ebG3zy2n/uvqEXq4DtLZhj0S5jhVMS8LCWV8S/
         JyeRyDsEuGqjkXex5PP1mWVeiHMuIJmW8eJbPD/8UuEaAITCpwvWDuHOwcDvD1HW/mjt
         y9QcYi/inl4VZNuUfbrmF35jQQegPOOqs+M3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c79j5BNX5JvuSaCQC3hnBE70FcREHVJqXkpTkSfEQi8=;
        b=VU5OfJE05nNdkeDL432BQnD0pYNqxmrHSBzOZK7nL43srUESdm21B8WoeL0ehr/MdT
         LZxu4UQ96JtbfGg8qflPwboLrCY5N1NSknNFSPFmfJTxwOGjQ78B4oIWq6NcEt68v2Ji
         so7B8r8hSOR1JsnEYHMr0iXwpQgXKmL0qnwOmPW9BsKXHuWryEQrfGjMeymHdGqUP8Og
         pJsi1s9Ep3lnicaBDgIPPkjLQQyUXWZXfV1S5dRyKEtpJQcvjMJc9f3jMZeiUbsu20FZ
         5EKiBwRu5d+fP+N0s0rOMFhjJyOYjFIqQJp8kKD8zXc5nFENcLREhzhdchT56LbAWLIj
         r0Ew==
X-Gm-Message-State: AOAM531gCGXOR5Ii5rxQVjQtHL/iz16AszI6KUI36GcTbphodnklhawL
        JXNB8/U5+WUOvN81+KNrchSJgw==
X-Google-Smtp-Source: ABdhPJydGhHolRTSu44ROjqoeiwXBDAGUjtyhjVnEyYGq7FVEgngCtcEdG36NEMGY3di0AnC/Mz1XQ==
X-Received: by 2002:a17:902:860b:b0:143:87bf:648f with SMTP id f11-20020a170902860b00b0014387bf648fmr1153440plo.11.1639436217839;
        Mon, 13 Dec 2021 14:56:57 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c2sm13640184pfv.112.2021.12.13.14.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 14:56:57 -0800 (PST)
Date:   Mon, 13 Dec 2021 14:56:56 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org
Subject: Re: Monitoring the status of your own patches on patchwork?
Message-ID: <202112131456.64F9F954@keescook>
References: <87mtl7ufl3.fsf@toke.dk>
 <20211213070840.4353fd6d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <877dc8fqui.fsf@toke.dk>
 <20211213080625.7febffc2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87zgp4z6w0.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgp4z6w0.fsf@toke.dk>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Dec 13, 2021 at 07:39:27PM +0100, Toke Høiland-Jørgensen wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> 
> > On Mon, 13 Dec 2021 16:48:37 +0100 Toke Høiland-Jørgensen wrote:
> >> > Status notification when checks are failing? Hopefully not, we don't
> >> > want people posting patches just to get them tested...  
> >> 
> >> Well no, but sometimes a patch will have failures despite the best
> >> efforts of the submitter (otherwise what's the point of the checks?).
> >> Right now the only way for me to discover that there's an issue is to go
> >> look at the patchwork web interface, and I wanted something that better
> >> suits my workflow (i.e., that's not in a web browser).
> >
> > I think that the maintainer should notify the submitter about 
> > the reason the patch state was changed (with the exception of
> > patches for a different tree, maybe). I know Kees has been 
> > trying to add more meaningful states to patchwork but I can
> > never guess the meaning of those either :S So no automated
> > state checker can replace the maintainer's reply.
> 
> Well, sometimes the maintainers forget to reply entirely :)
> 
> And yeah, I do realise that no bot is going to be able to tell me
> exactly what the current status is, I just want a tool to help me
> manually keep track...

I've mostly been trying to capture the state of the patch review
conversation with some kind of flag in patchwork. For KSPP, we've
documented it here:
https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project/Patch_Tracking

-- 
Kees Cook
