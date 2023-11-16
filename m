Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07279C197A0
	for <workflows@archiver.kernel.org>; Thu, 16 Nov 2023 12:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjKPMBA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Nov 2023 07:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbjKPMBA (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Nov 2023 07:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78871CE
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 04:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700136055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SJEaqLcE8LMZlLtaRlJKiYIAGpgF6F9Co9xx2cwkfaM=;
        b=cNRJLhf7XM8ZWo/6lOXHRqShXE8mxes+oMZsUo2gsJeYF2qaGYckI6wel8a3tjWONjVo5j
        h6elBK0FJA0kk0qkGV2UvJ5yZeZlF7HCOxRSeTPJEwEw3rxOnhzMu/MeH4gbKASY3Mrr+w
        VFZ6Ez4hPFn5WBTqmGrWG39VTps1NbY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-tCR7RvD3MjOLNdByrS8ZDg-1; Thu, 16 Nov 2023 07:00:54 -0500
X-MC-Unique: tCR7RvD3MjOLNdByrS8ZDg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cbc7d2e58so9066331cf.0
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 04:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136052; x=1700740852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJEaqLcE8LMZlLtaRlJKiYIAGpgF6F9Co9xx2cwkfaM=;
        b=G5IxLaK8Qa0wAjyQtHILw9SsEPGF+U/fwzyZtdQTc1BKKFvRtqsK2+cKn7mcbgECMg
         aV+vdYLoO1QKtj48qRCn+a1bWSC5PHSolTS9hfEIsvzsm/0RCdBtPAxHRCekp3X2b08a
         Clde4rJgyimr4Ac9vM4yuKEQ4uw1iY0un1OzIHR6tUqPK8uPgYzqojXNxllgCtVH/+LB
         MRvS5DZixL1rqL7BYy/r4Q23ZiiHwVthctJ0+MG16z/MQA99b0wM8ri6/AGaIHXxiGL4
         DXWcCuUFu6/FaNcglPkkcwpp/kdwsdWWSSontHu2phKN/H8PPxfyMGR5l8iMKMb0yRtF
         b/pg==
X-Gm-Message-State: AOJu0YzWM6/Pv4rVx+hRKZNonb1bqt4l5Dr4Y9+Wl9RFNquqcy0hek8i
        6K9zNo1DRi8JczKVBLO+nE4HLPsszbZ3BLpddf3LuIMAlutTHWV4UA+Q8IDPlnBBk9+HJ9ooxKg
        GuP/WTytJ8ji7Y8QbjGAKvfT6rr1ev70=
X-Received: by 2002:ac8:4e56:0:b0:421:c9a0:3e9b with SMTP id e22-20020ac84e56000000b00421c9a03e9bmr10037091qtw.3.1700136052286;
        Thu, 16 Nov 2023 04:00:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1/IWAdCHnltnz/yj6txJliOQv9AD9LCa2gapSrP4v9cvJOfR3amYIwYxVui43ueMcT5wRmg==
X-Received: by 2002:ac8:4e56:0:b0:421:c9a0:3e9b with SMTP id e22-20020ac84e56000000b00421c9a03e9bmr10037062qtw.3.1700136051926;
        Thu, 16 Nov 2023 04:00:51 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id df4-20020a05622a0ec400b0040331a24f16sm4294893qtb.3.2023.11.16.04.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 04:00:51 -0800 (PST)
Message-ID: <e2d18278-1fdb-440e-8009-4ec49749b71c@redhat.com>
Date:   Thu, 16 Nov 2023 14:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To:     Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>
Cc:     kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <2e8979163c8ed93f6990c6a91c34cdf96a76daaf.camel@perches.com>
Content-Language: en-US
From:   Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <2e8979163c8ed93f6990c6a91c34cdf96a76daaf.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/15/23 20:31, Joe Perches wrote:
> On Wed, 2023-11-15 at 19:43 +0200, Nikolai Kondrashov wrote:
>> Introduce a new 'V:' ("Verify") field to MAINTAINERS. The field accepts
>> a name of a test suite which is required to be executed for each
>> contribution to the subsystem.
> 
> Perhaps this is simply too much overhead
> process requirements for most kernel work.
> 
> While the addition of V: seems ok, I think
> putting the verification in checkpatch is
> odd at best and the verification of test
> execution should be a separate script.

I agree that this extends checkpatch.pl responsibilities somewhat. In the 
sense that it requires you to do something beside changing the patch itself. 
OTOH, checkpatch.pl already requires Signed-off-by:, which prompts you to 
check and clear up your authorship, similarly requiring work outside the patch.

At the same time, you're supposed to test your changes anyway. Sometimes it's 
manual and one-off, but often times running an existing test suite is at least 
beneficial, if not required.

In a sense, this is not *checkpatch.pl* itself requiring testing, but 
subsystem maintainers (who are opting in), and checkpatch.pl simply provides 
convenient means and an entry point for raising attention to maintainer's 
requests, and making it easier to discover the tests.

It also does *not* verify test execution, only alerts the contributors to the 
need, and requires certification. Again, similar to Signed-off-by:.

Nick

