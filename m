Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56971C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:31:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AEB8613ED
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhFQPdt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55885 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231790AbhFQPdh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623943887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3xNuEFHHi/7PyyWtU+QodfCtfBivL1enqvC70GkJy+I=;
        b=OKFMAva/1WJLgwgKW8zLo/ULhL6eCqbAamU7kiHd5LDij6hXt3hNlMhdghBKAZwqDqRwzg
        wtJuhG7hOB4hT0ohGZ7jghdF1NISwnGMNXkxs2z+vbnhsH7IPZPAHMTygPHsHOLXwhrSQn
        o36OQd7ccMDYHN2jtOmVixtXKabj8xU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-jlbGlLEIM82BaF7WHrwarA-1; Thu, 17 Jun 2021 11:31:26 -0400
X-MC-Unique: jlbGlLEIM82BaF7WHrwarA-1
Received: by mail-ej1-f69.google.com with SMTP id j26-20020a170906411ab02904774cb499f8so39993ejk.6
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3xNuEFHHi/7PyyWtU+QodfCtfBivL1enqvC70GkJy+I=;
        b=JWfG+ggZWFIIXpRHYtmfjgfcNScJ30e09NwyNX+7I/S13lgKvPcgl4C/7uTmkeLb0Z
         3MXoQ9X9lt4+uJio2gE58p80nivLVvzhzI68P+Fmp6lyFfCr5hJ5NiWNEZSoGT34OxzS
         YTLTwit0eCRpM1S0MnQXSuRXyHVS4AOtXKphWNJu3prqYp7QAccVTa5mAoFEN3b/F/1G
         ubkao5JXA2Y1AV/3JfjVD6KN9A2yIdMoUEsPGhetpHlZxCEnoAHJdkQH3wdM5tAILCvw
         aHm3qG+gMYu6ulSIApPQ32W73Xydo9myuiwTzoeb9wCow0YaUBT78/uYCKgQRlJeFxKQ
         liLg==
X-Gm-Message-State: AOAM532BcqImLOZ9yOohq49xwYe6f0RZhisvCWSbNbqvPqAHMg5k5PM7
        kMPEtgvP+XRwbSD2Y5Ofn07DaGlE7CkuejarxO1e/pYreqW9rlXYb2PcBMJSGCl6ST5BM/GOaLM
        77hQMww1+sAheOBYOK0GAWlsZVeKESWiMNfZpbwXoMoqKY6rzXquENUl/GDZSJsitgHmvUlbV
X-Received: by 2002:a05:6402:1111:: with SMTP id u17mr7401728edv.87.1623943884808;
        Thu, 17 Jun 2021 08:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxNYTVlUV3mxOfWqkQK1VqribNnjFxC7An6/5a409oSuFri3iJ7Owu2PUxxhKGTosKdxbgNw==
X-Received: by 2002:a05:6402:1111:: with SMTP id u17mr7401692edv.87.1623943884609;
        Thu, 17 Jun 2021 08:31:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id i26sm4528239edq.54.2021.06.17.08.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 08:31:23 -0700 (PDT)
Subject: Re: RFC: Github PR bot questions
To:     Mark Brown <broonie@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jiri Kosina <jikos@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
 <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
 <YMsfXuykH6z0ZbpM@infradead.org>
 <20210617145728.nahkvtxapozccm6c@nitro.local>
 <20210617151659.GF5067@sirena.org.uk>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b675c075-19e8-11ef-3174-49eb6975be6d@redhat.com>
Date:   Thu, 17 Jun 2021 17:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617151659.GF5067@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 17/06/21 17:16, Mark Brown wrote:
>> Won't this just end up reimplementing a lot of stuff that we already get "for
>> free" from Github and other forges? Yes, I know Github is proprietary, but so
>> are many SMTP gateways used to send the patch series. I don't see how what
>> the GH bot would do is different from:
> I think part of the concern here is that people have some standard
> expectations for how projects they work with on Github are going to
> function so if people end up using Github to submit patches we may end
> up with some culture and process mismatches which could cause issues.

This is true, and it's why I liked the suggestion of a bot that 
auto-closes the pull request but still 1) removes the need for the 
submitter to set up "git send-email" and 2) only does the send after 
basic checks for Signed-off-by and the like (checkpatch is already a bit 
borderline).

Paolo

