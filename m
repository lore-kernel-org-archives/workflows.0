Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5F9E95A8E
	for <workflows@archiver.kernel.org>; Mon,  9 Oct 2023 10:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346048AbjJIKOr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 9 Oct 2023 06:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346102AbjJIKOq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 9 Oct 2023 06:14:46 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6704AB
        for <workflows@vger.kernel.org>; Mon,  9 Oct 2023 03:14:42 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c2907ff9fcso52175881fa.1
        for <workflows@vger.kernel.org>; Mon, 09 Oct 2023 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696846481; x=1697451281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FqeJPo4xr0qnj0MWPH4DMv2xlwIktwjmfzMGOGDZYGo=;
        b=CHFcJJPIR0WzS3TKMODNutej/btKC5t1asjwB0YZn1TGl2g3qJnsG1rJdSslt6zsjg
         1dnBm4uxhrOeImbWdPPBuIKeLaCPMFguJn1LSAIgnPA6rATIpHBBYdS3zwMjA1AZ84Ok
         HrBpwk6kAGcl3A8gyDAQRwppWSnwVWnPHes9mzZX57ahmG/6kr11gYv4HasgF6to9AgR
         146wl9PJrPtdrSKoTzGobyMQ7Tneo8QmLjs4UOZ7TJgqn9kxnpo7NJeAyoLmj9KIDZew
         rgX4mBiKVdntRp4Zt8dYXXkQ3idhR2tITd+uD7oYmzkjAPqyYhlwUNtCI2+4bxHjV5K3
         WmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696846481; x=1697451281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqeJPo4xr0qnj0MWPH4DMv2xlwIktwjmfzMGOGDZYGo=;
        b=JbcDfAQ/D0F0sp/ZwrcaI6pSSfjcE+S+yYkrUjDal9wZvAV4f6s4HAZSP93QnbPhKM
         ZmYuFwETTX+uf7W+TF16Rz2TRy41NLIrJOBvpCYAEvVWf1ITe1jqTPJzBIsLc32TPFtr
         O7+x8HNtR9PGEtwZ89kG15KMvU9qG/aUKWs7I8uxf+NmheZ72hjFNdET7nerBhpAQNy7
         3CyxH1H9wLaGT5bj+mofw0REizczBYKggr2QQkNh48ro9S1kSSrwF86GLCo7QeLO1Rga
         XMm5EGxAelXrnJt/4SgOzqookc8SgnE6rFpAaqGf7lEubi9wxoqjmXQ5MPaNnzYEOYQL
         8h0g==
X-Gm-Message-State: AOJu0YzfCUaRAz6XI3lndrUVcvmibw7yi/biHetwE5g4zFxa/VHxPPnm
        mB1LJ0pI2ngDmpJIxTExFO9d7Q==
X-Google-Smtp-Source: AGHT+IGWNDQVdGgw7aPmcke7osm/NXht8O0eohz/2yMSNWZfWLoABVflcrzjyjR9bKBXw9UlYNEi4g==
X-Received: by 2002:a2e:938e:0:b0:2be:58f3:ccee with SMTP id g14-20020a2e938e000000b002be58f3cceemr12835915ljh.41.1696846480982;
        Mon, 09 Oct 2023 03:14:40 -0700 (PDT)
Received: from [192.168.200.173] (178235177147.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.147])
        by smtp.gmail.com with ESMTPSA id d17-20020a2e3311000000b002bcb9956a69sm2001771ljc.41.2023.10.09.03.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:14:40 -0700 (PDT)
Message-ID: <d84fd2f3-f633-464e-8205-9442d4ec89df@linaro.org>
Date:   Mon, 9 Oct 2023 12:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: Introduce Test: tag
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Submitting Co-Author <sub@coauthor.example.org>
References: <20231007-topic-test_tag-v1-1-513cd9e577ed@linaro.org>
 <8734ymvbds.fsf@meer.lwn.net>
 <CAMuHMdVf+bVj8at_GsHhRzHuDFbYGMmutOofMz1Ekv3TTxP4Qg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAMuHMdVf+bVj8at_GsHhRzHuDFbYGMmutOofMz1Ekv3TTxP4Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 8.10.2023 19:18, Geert Uytterhoeven wrote:
> On Sat, Oct 7, 2023 at 2:57 PM Jonathan Corbet <corbet@lwn.net> wrote:
>> Konrad Dybcio <konrad.dybcio@linaro.org> writes:
>>
>>> Currently, we blindly trust the submitters that they both compiled their
>>> code at all, tested it on a relevant device, and have done so in a manner
>>> that made sense for a given changeset.
>>>
>>> If at least two of these three things were always true, the review
>>> workflow would be much more exciting.
>>>
>>> Introduce a new Test: tag to help submitters express the way the patch
>>> was tested, making it easier to understand for reviewers and maintainers
>>> whether it was tested, and if so, whether that test was sufficient.
>>>
>>> I originally found something like this on Google's Android kernel repos
>>> and loved the concept.
>>>
>>> Test: make htmldocs and manual examination
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  Documentation/process/submitting-patches.rst | 18 +++++++++++++++++-
>>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> Do we really want to do this?  To me, it almost seems like it codifies
>> the idea that sending *untested* patches is OK as long as you leave out
>> the tag.
> 
> Exactly. We are already receiving too many untested patches.
> 
>> Others may disagree, but I don't think we need yet another tag for this.
>> Testing of patches before sending them should be the norm; if special
> 
> +1
> 
>> notes about testing are needed, they can go in or below the changelog,
>> as appropriate.
> 
> +1
> 
Okay, I see your points, let's forget about this..

Konrad
