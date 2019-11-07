Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D08C5DF60
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 10:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDF03214D8
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 10:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="NioLA2BO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfKGK5Y (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:57:24 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34132 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387839AbfKGK5Y (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 05:57:24 -0500
Received: by mail-pf1-f196.google.com with SMTP id n13so2485392pff.1
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=q+rrAonlRhmu+7o0ix7AGhcaZfWKtmB1rwQnh1QHLQ4=;
        b=NioLA2BOcqeO+V0bjI1x1z+IdJcFb9xeho76U2VnQhe269rF2OvODKJyrl6RmlUUEW
         xXU2XQHpD3cqQtak0Jg9sA0i/viXqHZSRAF8voBx9ElRgGDUFRLGUxqOSO0GOAR+nJ5p
         amf1q24NtE28lscm6f65eVdL01X4ccpQ2rJsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=q+rrAonlRhmu+7o0ix7AGhcaZfWKtmB1rwQnh1QHLQ4=;
        b=Cv9XVT+zl8TNAuMc4I9V/vRBf+IH/nTCBs+BBtmL7dzCOzdsnVWZsNPFPpkQwbd0xW
         T4bxopwBX/i5X3/z6qPDg+B7Xae1NnaW7xthr/dWcDJRTx5qLjTQBHkmp72W3zdX7zS3
         TycKI6eIoH7hmL+KCBg7Iwq6cSNOH/Bu0pZy9NieKgpwAnNH4D7Xhi7+33Yazvw6vLfV
         FIdtABTh45g3KFa08ijnnwYJTHIU8SoWv3ObHh+AFREB0ZWR6+8Ts7024dkbky9P8P/P
         fyiEB+Aj9k86q6wjgUEYZw8Nj4law2dPq9JxA675s+gD5OEoH6NfTpgUVZtQ/T7qj9Sc
         aZng==
X-Gm-Message-State: APjAAAWYM3KAIMGqKT90Xs0xJdRoal6k0ikkn8aQa7RK0PqRePXYbeJ6
        UysPjBzbFuYEBKYT9YvtU3XQww==
X-Google-Smtp-Source: APXvYqzFPHqNfwz0zR+NLbnpIvESpBMmK5fYBU3F0iPiu2h/rbEn2XLXlY0i8V0spS9k2ejofE11aQ==
X-Received: by 2002:a17:90a:ff04:: with SMTP id ce4mr4276066pjb.118.1573124243649;
        Thu, 07 Nov 2019 02:57:23 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-40d3-eca3-e70b-6bc4.static.ipv6.internode.on.net. [2001:44b8:1113:6700:40d3:eca3:e70b:6bc4])
        by smtp.gmail.com with ESMTPSA id p9sm2497018pfq.40.2019.11.07.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 02:57:22 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Subject: Re: Structured feeds
In-Reply-To: <CACT4Y+Ywzbwz7GNfOCJb+DGdKEdkAh+v+20hmNG7S1riEbhTNA@mail.gmail.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com> <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <20191106205051.56v25onrxkymrfjz@chatter.i7.local> <CACT4Y+Ywzbwz7GNfOCJb+DGdKEdkAh+v+20hmNG7S1riEbhTNA@mail.gmail.com>
Date:   Thu, 07 Nov 2019 21:57:19 +1100
Message-ID: <87tv7ggdio.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Dmitry Vyukov <dvyukov@google.com> writes:

> On Wed, Nov 6, 2019 at 9:50 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
>>
>> On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
>> >This is an non-trivial problem, fwiw. Patchwork's email parser clocks
>> >in
>> >at almost thirteen hundred lines, and that's with the benefit of the
>> >Python standard library. It also regularly gets patched to handle
>> >changes to email systems (e.g. DMARC), changes to git (git request-pull
>> >format changed subtly in 2.14.3), the bizzare ways people send email,
>> >and so on.
>>
>> I'm actually very interested in seeing patchwork switch from being fed
>> mail directly from postfix to using public-inbox repositories as its
>> source of patches. I know it's easy enough to accomplish as-is, by
>> piping things from public-inbox to parsemail.sh, but it would be even
>> more awesome if patchwork learned to work with these repos natively.
>>
>> The way I see it:
>>
>> - site administrator configures upstream public-inbox feeds
>> - a backend process clones these repositories
>>    - if it doesn't find a refs/heads/json, then it does its own parsing
>>      to generate a structured feed with patches/series/trailers/pull
>>      requests, cross-referencing them by series as necessary. Something
>>      like a subset of this, excluding patchwork-specific data:
>>      https://patchwork.kernel.org/api/1.1/patches/11177661/
>>    - if it does find an existing structured feed, it simply uses it (e.g.
>>      it was made available by another patchwork instance)
>
> It's an interesting feature if a patchwork instance would convert and
> export text emails to structured info. Then it can be consumed by CIs
> for precommit testing and other systems without the need to duplicate
> conversion.

This already happens.

Snowpatch does this and uses it to run CI checks on patch series as soon
as they arrive, and sends them back to patchwork as test results. It has
been running on linuxppc-dev for over a year.

Snowpatch is at https://github.com/ruscur/snowpatch

An example patch showing the checks having been run is
https://patchwork.ozlabs.org/patch/1190589/

I think there's a different CI system used for some device-tree patches:
e.g. https://patchwork.ozlabs.org/patch/1190714/ - I have no idea how
this works in the backend, but it also uses the patchwork API.

Regards,
Daniel
