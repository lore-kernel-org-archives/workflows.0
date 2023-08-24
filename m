Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DDEC71153
	for <workflows@archiver.kernel.org>; Thu, 24 Aug 2023 18:05:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242931AbjHXSF0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 24 Aug 2023 14:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242974AbjHXSFG (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 24 Aug 2023 14:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5697619BF
        for <workflows@vger.kernel.org>; Thu, 24 Aug 2023 11:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692900257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A9SST7fHE/WqdQ5GLSmuWsFnuI1aG/JNWIXMLRzSNSQ=;
        b=OxE7RaoozoXOh44tcL8NzXgZDC2CaI/ACVXL3UZkXIz1GNxnhbhmZ4hqfMMCPF2IRqxdwy
        qs2f3uSINDiM73hyvAJKowpVIEzFnAg7Sr44uJemxsWuU0Sw6le8ZGlf56+P1M1XDs7Mbt
        Gj+zP4vlD4gl896uT9/kwosY/BX8Qz0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-Wai8aZ0aPKCpklVy-BC3Jw-1; Thu, 24 Aug 2023 14:04:15 -0400
X-MC-Unique: Wai8aZ0aPKCpklVy-BC3Jw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ba1949656bso725301fa.0
        for <workflows@vger.kernel.org>; Thu, 24 Aug 2023 11:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692900254; x=1693505054;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9SST7fHE/WqdQ5GLSmuWsFnuI1aG/JNWIXMLRzSNSQ=;
        b=So/+HXrDzBWY33uM2uEeJFlKs87Q1rqwVS/APUHjQzRFCLwP6/MxSqBiLc6E2pqHY7
         vvUjl6mIEaV43P6JjKvAWHtED49csyCcokn1mlf/EERZPI9nC3Dgol9oa3ZiZrA+S7+n
         alFVejlgZJwIS2EiReAOclRD5prox3BAjiNhqPLZZQ+lio9E62K6ULvWdCwTwsCcBDLw
         ykYGfHVMoRFy3UwtwKYP66bIOeQ/1AZRzDFjy8/fko3RPL+6Jx30avTRun4GRetgzcL5
         558OK8sSGqszioAJgGlcK9N0ucINtFvRcMkWxCNjz9CmvpLt6KcFVqrys3SyVg+xsU6l
         uc3g==
X-Gm-Message-State: AOJu0YwQXO0hh+O2HDJyjgw9Fa/RNP4lDrgb5tWxQP4U230L50MXO8n7
        2uF9lhYcpQJDGNzilZ5FHCHIMxirKVdN/fdnFlMerY5LeyI+TfAfQ9t/gGaF0WD1AoEhsB8O3CU
        lm4CyrFEqK38gSE7EpJC5f9SWi4zR
X-Received: by 2002:a05:651c:cf:b0:2bc:bdbd:1542 with SMTP id 15-20020a05651c00cf00b002bcbdbd1542mr9712298ljr.11.1692900253867;
        Thu, 24 Aug 2023 11:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0sIYawjda6J2xb/e9epjCPf0dP8yf250y5uk7yUB4TohorNjF7MlBt34/bfdobw1ayLS6Eg==
X-Received: by 2002:a05:651c:cf:b0:2bc:bdbd:1542 with SMTP id 15-20020a05651c00cf00b002bcbdbd1542mr9712280ljr.11.1692900253389;
        Thu, 24 Aug 2023 11:04:13 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906159400b009a1b857e3a5sm4208970ejd.54.2023.08.24.11.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 11:04:12 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 401B5D3D1E5; Thu, 24 Aug 2023 20:04:11 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Selective lei filters and replies to old threads
In-Reply-To: <2023082415-elongated-cogwheel-8465@gregkh>
References: <87ttsxbvqd.fsf@toke.dk> <2023081720-wrath-winnings-bb16@gregkh>
 <87msyob551.fsf@toke.dk> <2023082415-elongated-cogwheel-8465@gregkh>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 24 Aug 2023 20:04:11 +0200
Message-ID: <87bkew8gh0.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Greg KH <gregkh@linuxfoundation.org> writes:

> On Fri, Aug 18, 2023 at 08:02:34PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Greg KH <gregkh@linuxfoundation.org> writes:
>>=20
>> > On Thu, Aug 17, 2023 at 04:15:54PM +0200, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:
>> >> [0] Side note: if anyone has a nice trick to specifically exclude Gre=
g's
>> >> stable patch bombs from this, I would be interested in hearing about
>> >> that as well :)
>> >
>> > I thought those stable patch bombs had a X- header on them, like:
>> > 	X-stable: review
>> > and
>> > 	X-Patchwork-Hint: ignore
>> > but somehow it looks like I'm only adding that to the first message in
>> > the stable-patch-bomb series.
>> >
>> > Would it help for me to fix my side and add those headers to make it
>> > easier for you to be able to ignore them?
>>=20
>> I don't think it's possible to match on arbitrary headers in Lore
>> searches (maybe public-inbox could be taught that?), but it would
>> certainly aid in adding local filtering after fetching which would work
>> for me as a workaround. So yes, please! :)
>
> Turned out my scripts were broken, and the header I was supposed to be
> putting on all stable patches was no longer happening (something changed
> in git format-patch's output I think.)
>
> So this should be now fixed up with the latest 5.10.192-rc1 announcement
> and emails.

Yup, I see the tags - great, I'll set up some filters. Thanks! :)

-Toke

