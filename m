Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D62C54FB9
	for <workflows@archiver.kernel.org>; Thu, 16 Nov 2023 13:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjKPNli (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Nov 2023 08:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjKPNlh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Nov 2023 08:41:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662C7D49
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 05:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700142090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EsSXUyt/e0sQuOdfCJ7zam0EkNtcBbRjeB4I9K3C2uc=;
        b=drz5AtB7VB4Ys9POMnKx2wTXEk3ivz1KMbuqZYokPkXrs7tAqRhvVW6eZH9S01rPlcYhXe
        YjwBRwSL5kPOeOGhXQvnHfR7cIpbPdcQ2Gewoh2y0yt1rBEIwte6s75n+PuwRc2l5JlsxY
        Ry6c8fKxsbzRt8F8H8CQdf7xatDe+TE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-4xrMoAYUPmaMZtW1ri5_xQ-1; Thu, 16 Nov 2023 08:41:28 -0500
X-MC-Unique: 4xrMoAYUPmaMZtW1ri5_xQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-778b3526240so89386685a.1
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 05:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142088; x=1700746888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsSXUyt/e0sQuOdfCJ7zam0EkNtcBbRjeB4I9K3C2uc=;
        b=W90FF31/NoWrSfa4HdzEet8hZ6uACcFOp8GXwSwPwstK/n6oPQ+f6kK42ELEayj73C
         eOtoLpW92A6Vad4FrZ4VNWphJ7VayQYcScxHEn7f0wW9ZnEm0BZgAKQPLQCQpDf6mXTC
         3ZCuvXT9R7um0K3QLbU0rB5wPeN2VofCc+wrzmEn9dZ+OXQaUeIGGF3cgY3Yv9GfnmAY
         HSNeGuo61Ty5PvLNDM1zR8BPxekPt0ail6gocEZ9ll7KYxLSDtoYLSqG7Nrb4K5Oiq6y
         qJp3Poh6ze3gaZYAuhPPxLECUC4nTOFa8AxEKU5wF+r03okzl1Aq41RScBBKlYAT1wbR
         9QgQ==
X-Gm-Message-State: AOJu0YwBVt9yCsnruLdE3Eq3ufOpqHFMaj5Fb4RuABDsiaqwdnebuBkD
        C9uIQ1thtUufnTJ9FjHdSxFDEBbvw5WIgHJNxM07C10bej91SRYVkSgpCr1TDK/cq+Nc1WvkPSg
        Nuuk4G5Ikh36ee7Y/4vjI
X-Received: by 2002:a05:622a:488:b0:421:b9cb:933b with SMTP id p8-20020a05622a048800b00421b9cb933bmr9083228qtx.11.1700142087742;
        Thu, 16 Nov 2023 05:41:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHP+XXYET5Ab+tO0229Z6CnnoDuA52rBAaPnwBvw0yeaoWDBt8JoZdd6VV2qb69IdSrAAk+nQ==
X-Received: by 2002:a05:622a:488:b0:421:b9cb:933b with SMTP id p8-20020a05622a048800b00421b9cb933bmr9083209qtx.11.1700142087439;
        Thu, 16 Nov 2023 05:41:27 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id bb41-20020a05622a1b2900b0041817637873sm2706590qtb.9.2023.11.16.05.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 05:41:26 -0800 (PST)
Message-ID: <0f517de6-9eea-4641-a1dd-4631360fbe5f@redhat.com>
Date:   Thu, 16 Nov 2023 15:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>, workflows@vger.kernel.org,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>,
        Charles Han <hanchunchao@inspur.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Kernel Unit Tests <kunit-dev@googlegroups.com>,
        Linux Kernel Self Tests <linux-kselftest@vger.kernel.org>,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <ZVYXEry40HTCis00@archie.me>
From:   Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <ZVYXEry40HTCis00@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/16/23 15:20, Bagas Sanjaya wrote:
> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
>> Make scripts/checkpatch.pl ensure any added V: fields reference
>> documented test suites only, and output a warning if a change to a
>> subsystem doesn't certify the required test suites were executed,
>> if any.
>>
>> If the test suite description includes a "Command", then checkpatch.pl
>> will output it as the one executing the suite. The command should run
>> with only the kernel tree and the regular developer environment set up.
>> But, at the same time, could simply output instructions for installing
>> any extra dependencies (or pull some automatically). The idea is to
>> get the developer into feedback loop quicker and easier, so they have
>> something to run and iterate on, even if it involves installing some
>> more stuff first. Therefore it's a good idea to add such wrappers to the
>> kernel tree proper and refer to them from the tests.rst.
> 
> Does it also apply to trivial patches (e.g. spelling or checkpatch fixes
> as seen on drivers/staging/)?

Do you mean, will checkpatch.pl suggest executing test suites for trivial 
patches as well? If so, then yes, of course. These are inevitable victims of 
such mechanisms in general, and it's hard to make an exception for them, but 
we have to consider the overall benefit of having more uniform testing vs. 
making trivial changes a bit more difficult.

Nick

