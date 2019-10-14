Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD3EC4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5533721882
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z31jiicz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbfJNNSJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 09:18:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22440 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729858AbfJNNSI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 09:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571059086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DgRhMcrAJVNq2kY4WomH1jzURjSl89Fz/CBRmWwmOdI=;
        b=Z31jiicztqow0F+uU5UpKLx+XagOOCDGqKsliaqpi5qP6DtRdHj64Z8xtPJTW8IITj6f26
        5GjnrAbkRUMTXnfXrG18UyYS0sDyGPq+9s3cRbpxMP1o9O6EKcMRhoxWTyPArK9lcPjur4
        2gtuyutsACIvx8lIIKw8N15SymnthMM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-aKpFJULJOAmCEML0MYUK7Q-1; Mon, 14 Oct 2019 09:18:05 -0400
Received: by mail-lj1-f200.google.com with SMTP id e3so3357681ljj.16
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 06:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=DgRhMcrAJVNq2kY4WomH1jzURjSl89Fz/CBRmWwmOdI=;
        b=BQAD9CkfkhrIjE8/gm0G0Y4pjt0OKnoMpkMIaW1SUL8oPjjWkKOqcUXTeg/FvXiIel
         wSqcQXmDSRa+SKsMUR0fotD2xJqeo57qQsy1WSzdi1LG656ySFQZeaZqWxSzTyAQ9gMb
         u25RWjpd7xqj3TKdXjOS/UD/Qax+hnU0XNP+C8wkdH0ZGQskxpVLbl/ZRs0sx3iiMKSK
         a4Jd9fg85taRsKG9NHyV30S3OgD7ZmzD+nAKiheROmdiCv55UrArTW290C+VFEQMvR7f
         gSB0YmV0MdfsX+4H1A9EuoioSR1iju6K4hJcl1HpYZYed7EX8UCsSmw49HCCzZj3hSCT
         +HPQ==
X-Gm-Message-State: APjAAAUwrLjVeicCjp2o62hJK9ub5Pe50r5PaKhhp4GEPSzAdeyEm4TS
        V78E7SnP7+ZHfM2XPx01ypN+HMy0NK9VKGI9YFa/pjB7SC1nX5kEueAS4aeBl2xXtDGYgpQc0r0
        lk38nxP22KnZVjp00DZDO
X-Received: by 2002:ac2:5a49:: with SMTP id r9mr16991447lfn.54.1571059083610;
        Mon, 14 Oct 2019 06:18:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2Vht+ZmxGgNrM2DSVIv4D3xMxkDALNNsGVAYphe2pIrU9mFXJJxwSGu1YaFtyl6J6F/tn+w==
X-Received: by 2002:ac2:5a49:: with SMTP id r9mr16991431lfn.54.1571059083443;
        Mon, 14 Oct 2019 06:18:03 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id c26sm4205293lfp.20.2019.10.14.06.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 06:18:02 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 67AB918063D; Mon, 14 Oct 2019 15:18:01 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
In-Reply-To: <20191014122637.GB5564@mit.edu>
References: <20191011.113254.1964556815296845399.davem@davemloft.net> <20191011155949.145f0f7d@coco.lan> <20191011.121153.1410013220730418292.davem@davemloft.net> <20191011141909.1ccb58b3@hermes.lan> <20191011174719.16e997f5@gandalf.local.home> <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com> <20191011190009.6ee15756@gandalf.local.home> <20191011170839.75c52ad3@hermes.lan> <87lftotdv8.fsf@dja-thinkpad.axtens.net> <874l0bk3qb.fsf@toke.dk> <20191014122637.GB5564@mit.edu>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 14 Oct 2019 15:18:01 +0200
Message-ID: <87sgnvihyu.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: aKpFJULJOAmCEML0MYUK7Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

"Theodore Y. Ts'o" <tytso@mit.edu> writes:

> On Mon, Oct 14, 2019 at 12:42:36PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> It should be detectable, though, right?
>>=20
>> Say you have two independently administered patchwork instances (or even
>> better, two different software packages entirely) that both subscribe to
>> the mailing lists, and compare patch content with each other. They
>> should at least be able to detect mismatches. Especially if you add a
>> sanity check before discarding duplicate message-ids.
>
> They don't even need to compare against each other; patchwork is about
> to add a feature where you can look up patches via message-id, right?
> That means it's easy enough to write a program which fetches patches
> from patchwork, and compares it to the patches found in
> lore.kernel.org.  If they don't match, then an alarm can be sounded.

Yeah. I guess what is needed is to go from "can be" to "will be" (as
Daniel pointed out in his simultaneous reply).

>> This way you'd need to compromise multiple machines to achieve the kind
>> of compromise you're worried about. And you can add more independent
>> machines until you're satisfied that the risk is low enough :)
>
> Yep, exactly.  This is basically the theory behind Certificate
> Transparency[1], applied to patches.

Indeed I'm familiar with certificate transparency, so this was certainly
not an idea conceived in a vacuum ;)

-Toke

