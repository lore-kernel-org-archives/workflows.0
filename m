Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24A4C197A0
	for <workflows@archiver.kernel.org>; Thu, 16 Nov 2023 13:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjKPNwZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Nov 2023 08:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjKPNwY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Nov 2023 08:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778EE8F
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700142740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5IhNoZXTI+fdHl/DEzf2VZ3Tt0lwyDlfYgNAl7FX9nY=;
        b=YkrKCq78AMlfCktxTXH1JEP0XY5go1FyoktCnNf/le057/WSm7oP2+DkR/ScKfSL889fQg
        7yw/ZyV64O64AcA637x+pVk8mjfMdirBUSX6iDOblrrx+4h53nPhzTdpJasGlVz+9LxJJn
        ujtK6RoFiWoKeE8etNL54B5TBmxDLQM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-nQKJvJcsMSW1j4c_PR-MNA-1; Thu, 16 Nov 2023 08:52:19 -0500
X-MC-Unique: nQKJvJcsMSW1j4c_PR-MNA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7788ea971caso83307185a.2
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 05:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142739; x=1700747539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IhNoZXTI+fdHl/DEzf2VZ3Tt0lwyDlfYgNAl7FX9nY=;
        b=LUt7cLoZmnqzNndBrX1RC4nOGPCEaoiLs6cuz4Cet0HXdZty5+QkCfFXF3K7/XlOPq
         7T0T0O5D98w/Qoc5YXE8DtZdbAbTdRJ7HLjG6TqdKofnbk/9vsW321J+MotEiIRnb5kD
         AOblvcoCQF1AkSap55hzzJmEyPbOSb7VaV/bIW+pHX+7CP94OaYUtnAFOhaYLn8dpISP
         tqAwUeiaEtwnHiFRZwrF5VFpQKG2kUkJO9LpuIMRlVBYqGvAZhwx9u/kJ4QgMas2VZmZ
         nkHn+TmOD34yXyMMiSyOshu5UgxP7AgwZ6zOKvq6225oE5tzVOlcec3cGrd/ej2Um5Zn
         no4A==
X-Gm-Message-State: AOJu0YyJKIHT42dtB4s4C3Hi7kKH5hRV5plh0Kj0JO42/k3xVPXa3egM
        jtW7nuc09bj4qEGK5o8hqEVhHtryRg0hKKv5FfLkjKR2+QtC0Txc5XBn4ImNfhDEe+wNR5mlyU7
        82Mv0fgQjAx5h5C43xh8o
X-Received: by 2002:a05:620a:458a:b0:767:8373:a890 with SMTP id bp10-20020a05620a458a00b007678373a890mr11230862qkb.45.1700142738895;
        Thu, 16 Nov 2023 05:52:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXaWFlxQm4PRVVx+8Fj6YF5JxVcSJZQ1LW22bPzS1N8WPExtfrQ7x7wEOyBfxYn5nY0LpOUw==
X-Received: by 2002:a05:620a:458a:b0:767:8373:a890 with SMTP id bp10-20020a05620a458a00b007678373a890mr11230835qkb.45.1700142738580;
        Thu, 16 Nov 2023 05:52:18 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id qz6-20020a05620a8c0600b00774292e636dsm4282695qkn.63.2023.11.16.05.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 05:52:17 -0800 (PST)
Message-ID: <6d705be6-bcce-453a-a0e0-305b3212d4ff@redhat.com>
Date:   Thu, 16 Nov 2023 15:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <20231115-charcoal-sloth-of-wizardry-5a75fa@nitro>
 <13fe4866-0522-4690-a060-160fdab9f54b@redhat.com>
 <195ed085-9f66-4951-bb5b-2d8560f380eb@sirena.org.uk>
From:   Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <195ed085-9f66-4951-bb5b-2d8560f380eb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/16/23 15:26, Mark Brown wrote:
> On Thu, Nov 16, 2023 at 02:14:24PM +0200, Nikolai Kondrashov wrote:
> 
>> Yes, that would be better indeed. However, checkpatch.pl doesn't process
>> cover letters, and so we would have no automated way to advertise and nudge
>> people towards testing.
> 
> Back when I used to run checkpatch it seemed to cope, it obviously
> wouldn't find much to look at in there but you could feed it an entire
> series with cover letter and the cover letter wouldn't cause any extra
> issues.

Ah, good to know, thank you. The question now is whether we can expect, or 
require, submitters to run checkpatch.pl on the complete patchset, cover 
letter included, *before* sending it.

>> P.S. Git forges do that for you by nature of actually running the tests
>> themselves, automatically. *Ducks*
> 
> The ability of forges to run tests is not hugely relevant to large
> portions of the kernel, for drivers you're wanting the tests to run on
> the relevant hardware and even core changes will often need hardware
> that exercises the relevant features to run.  In these areas you're more
> just looking for someone to say that they've done relevant testing but
> there's not a substantial difference between say a comment on a pull
> request or a followup email.

Agreed.

Still, there *are* largely hardware-independent (and thus maybe more 
impactful) parts of the kernel too.

Plus, you know yourself there's a bunch of companies willing (if not outright 
clamoring) to contribute their machine time for testing, provided some good 
will and authentication on the part of the contributors. And git forges 
provide good support for the latter. So perhaps *some* special hardware 
*could* be arranged there too, making it more useful.

Nick

