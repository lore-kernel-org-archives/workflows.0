Return-Path: <SRS0=PtRO=YK=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6331BFA372B
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 20:45:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 328AE21835
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571345139;
	bh=PBMQzlJhfwdjzlJul3iNyt+OcLxbUAw68Myl91LPzt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=V560wB/o5jdhyIUIc9PRF5XSNkDdevreJUrGDe7c8xycABMnuv4l11qEaSU3uphFv
	 rIjpqD3buDcHoww25+iW6xhNHCFjMamdkzPa3zyzOu6Q2zqrnrhFrKorh0rubiKDo9
	 VdhDyG3klZXfTlhXKWzCmZIDzKV9GUujgfA2cfUw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394787AbfJQUpi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Oct 2019 16:45:38 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:33822 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729725AbfJQUpi (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Oct 2019 16:45:38 -0400
Received: by mail-qk1-f182.google.com with SMTP id f18so2612763qkm.1
        for <workflows@vger.kernel.org>; Thu, 17 Oct 2019 13:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nm0y8itQwNxycU+KkCNl4rRv/KEizP64S0h3JjcmM1I=;
        b=CSQkOFqGa4+s7tlWZ+YT+n2bPhZ97z4bHV0wAW/4JArlvdW9LCrTnANTSBE9hoh+r3
         aLCCN31qCG5v4O5opbrSGTmYoK8vjfAnzSNQSkTHVmK2TqvWiRqCAptFypjby7HlsV/1
         JV9EAp/r3IE3NFEsoDFZLsoUvjPn3Kq0IrbSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Nm0y8itQwNxycU+KkCNl4rRv/KEizP64S0h3JjcmM1I=;
        b=P8t+XlUirLUEBXsJ8huZcIlEMBnwxiKdNpJWPXUeLvOOWh1yd/SwL8iHSH479LjLSG
         NcQoa5C/NLkerGeNTHYidTnbwiWZ/nF6Sq9hiHt+DllPGABVZfrL9SEm5ocu4jb7AsF7
         UFuLYd3LzQ01hOG6wkNlTE624jE/qrMYlM+ER6ygHXgvKDQXXvjVcNYw9ea7jnK90/ZY
         P38tMxIawvG3+OtBQMDAw1C4G/KhVm21yEqYs/nEQFoCzCMgwhg6wRIEZWzc3Y7B2jtu
         p1of242J/z//z5U+I9KyeYbSJ0WHmgz5UYzVrccavL9ePwsAycyFKrzqSX2CpsiwGPq7
         C7mg==
X-Gm-Message-State: APjAAAVAc76mBoCfxkIoBF82KmHM50S9Ke7R+vpBQf+3WFKx+pNat0Pf
        egceAusNjsCTKLNuLvK2Qbql2Q==
X-Google-Smtp-Source: APXvYqx67ShxHPsHmU4ie8AOdmAv0dC9DADOXV5AgHyiljWTFyBCcpGVIsssPGNMCbxjXk9vRGW2Aw==
X-Received: by 2002:a37:507:: with SMTP id 7mr5422980qkf.107.1571345135302;
        Thu, 17 Oct 2019 13:45:35 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id j137sm1974051qke.64.2019.10.17.13.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:45:34 -0700 (PDT)
Date:   Thu, 17 Oct 2019 16:45:32 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Greg KH <greg@kroah.com>
Cc:     Santiago Torres Arias <santiago@nyu.edu>, Willy Tarreau <w@1wt.eu>,
        Vegard Nossum <vegard.nossum@oracle.com>,
        workflows@vger.kernel.org, Git Mailing List <git@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Eric Wong <e@80x24.org>
Subject: Re: email as a bona fide git transport
Message-ID: <20191017204532.GA6446@chatter.i7.local>
Mail-Followup-To: Greg KH <greg@kroah.com>,
        Santiago Torres Arias <santiago@nyu.edu>, Willy Tarreau <w@1wt.eu>,
        Vegard Nossum <vegard.nossum@oracle.com>, workflows@vger.kernel.org,
        Git Mailing List <git@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Eric Wong <e@80x24.org>
References: <b9fb52b8-8168-6bf0-9a72-1e6c44a281a5@oracle.com>
 <20191016111009.GE13154@1wt.eu>
 <20191016144517.giwip4yuaxtcd64g@LykOS.localdomain>
 <20191017204343.GA1132188@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191017204343.GA1132188@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 17, 2019 at 01:43:43PM -0700, Greg KH wrote:
>> I wonder if it'd be also possible to then embed gpg signatures over
>> send-mail payloads so as they can be transparently transferred to the
>> commit.
>
>That's a crazy idea.  It would be nice if we could do that, I like it 
>:)

It could only possibly work if nobody ever adds their own 
"Signed-Off-By" or any other bylines. I expect this is a deal-breaker 
for most maintainers.

-K
