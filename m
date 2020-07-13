Return-Path: <SRS0=VUj4=AY=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA0BC433E0
	for <workflows@archiver.kernel.org>; Mon, 13 Jul 2020 17:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C1CE20771
	for <workflows@archiver.kernel.org>; Mon, 13 Jul 2020 17:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFwUJoIw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgGMRte (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Jul 2020 13:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729681AbgGMRtd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Jul 2020 13:49:33 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91888C061755
        for <workflows@vger.kernel.org>; Mon, 13 Jul 2020 10:49:33 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id k18so13070189qke.4
        for <workflows@vger.kernel.org>; Mon, 13 Jul 2020 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=BkAx4te/t2dP0CHkl/ckW6vk0ixaMlM/BCr6OR+PoqE=;
        b=bFwUJoIw6L4+/hxp2Z2pdqws9l+yh2KoPi+XokfVKLFcDunOcqGaNPbfLOqR5KYp/g
         AjrTRqasUH2zkdNpbpN3axG8nVau4kn8Ejni/5A2D/hcss/WXvnjxaKR0ZS7fv/E4rcv
         9AC+G59tL+ctT/KpvgVJdv4/8WgC6FcZaTdSXcVSLKf1dIjSR7b3FgMCb7Vpqy2muLDA
         h6U/0HE6NUDkBaUonoBLW/HlOr0vfotzYXyL6wOqF4OFbLcXHMm8vHfXYoBsF+Jf6y8Q
         SdmjvJobJBJMFtv/SNood4m3SUQeyBaFcEHWmSvgdkgCizcooCOKrOH6DjCxFNoT/rMt
         qAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BkAx4te/t2dP0CHkl/ckW6vk0ixaMlM/BCr6OR+PoqE=;
        b=ErJXU8DxeH6r5x1YikIbZuePXO3cW4VpbXyuTFWeV3l4sYoUttGFsaMNmzDB9bzMRQ
         beU913XwKoOu7bjIPTe9z1JKa7IlXkRRbmdYsa91vwOa8zz7gQKzrz/qZTyT1uXyl6q2
         qwH1m7TK+vFWk2dJ5YYhL9LpwZvf62AkWJHS1bSCgwsZfvUy2vEjwi0FSvXb9us1lrag
         6g3k+qWpp4s9yaNJmvpjnsAV5eUbI1kyqLs9vT+pyhqMG90abyPilFCHrlC26c1E+BTS
         VSrkxAJkzk6/FMWV3ELlRa/EFPb0rqCBrCCC0Z2qP/9YO5vhQPaTPeaQtQ+UrLN5UiMp
         YjXw==
X-Gm-Message-State: AOAM533WP+luahqorPsAN9mbbvjv80l2yQ8JYqL2/oFnKiAYCeIQ52oK
        03EPWbSB46IFuqV8maEeCKF6Mkvu
X-Google-Smtp-Source: ABdhPJxVL0IB06yfz6tICy3YQ/BtULZUJQDjsSZikcvv+dSP+HZhJNKAEVFXL6/suCQnC9PmGq58qw==
X-Received: by 2002:a05:620a:a56:: with SMTP id j22mr753062qka.193.1594662572411;
        Mon, 13 Jul 2020 10:49:32 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id a5sm20012752qtd.84.2020.07.13.10.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 10:49:31 -0700 (PDT)
Subject: Re: KernelCI Community Survey
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        kernelci@groups.io, automated-testing@lists.yoctoproject.org,
        kernel-build-reports@lists.linaro.org, workflows@vger.kernel.org
References: <4e70209b-e637-abdf-d72a-7cb978956f9d@collabora.com>
 <d03548cc-86ee-4922-7819-9a22acc055ee@collabora.com>
 <c19726e0-0483-c718-2d33-e7ac9c88cb19@collabora.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <f464f853-246b-2eac-03be-91385e5457e3@gmail.com>
Date:   Mon, 13 Jul 2020 12:49:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c19726e0-0483-c718-2d33-e7ac9c88cb19@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 2020-07-09 17:32, Guillaume Tucker wrote:
> On 11/06/2020 11:11, Guillaume Tucker wrote:
>> + workflows
>>
>> On 02/06/2020 22:22, Guillaume Tucker wrote:
>>> As the KernelCI project keeps growing, we need to know a bit
>>> better what the Linux kernel community needs in terms of
>>> automated testing.  We would really appreciate if you could
>>> please spare one minute to fill this survey form:
>>
>> Sending out a big Thank You for all the replies we have received
>> already, your input is proving to be highly valuable.  We thought
>> it would also be relevant to share this on the workflows mailing
>> list and reach a slightly broader audience while the survey is
>> still open.
>>
>>>   https://forms.gle/Y5iuyLXgQr2y3SrF6
>>
>> Please feel free to fill the form if you haven't done so already
>> and share the link above with others you think might be
>> interested.
> 
> Thanks again everyone who has responded to the survey.  Here's
> the detailed report which also includes a spreadsheet with the
> full results (minus any personal information):
> 
>   https://foundation.kernelci.org/blog/2020/07/09/kernelci-community-survey-report/
> 
> Please also note that we've decided to re-open the form until the
> end of August, in case some of you missed the opportunity to
> respond before.  The link is the same as in my previous email:
> 
>   https://forms.gle/Y5iuyLXgQr2y3SrF6
> 
> Best wishes,
> Guillaume
> 


Some feedback from my experience answering the survey today.

Question "Would a web-based dashboard fit well within your workflow?"
had two answers.  The answers to choose from made assumptions about
why one would choose "yes" or "no".  The second answer is "No thanks,
I only want to work with emails and command line tools."  The second
answer does not allow me say that I have a preference for emails
and command line tools, but I find a web based interface to also
provide value.

It would be better to split the original question into two questions:
  (1) web-based dashboard useful? (yes/no)
  (2) emails and command line tools useful? (yes/no)
And it would probably be even better to split (2) into (2) emails,
and (3) command line tools.

I wanted to answer yes to each of them, but if only one was available
then I had a preference, which is what my answer was based on.

Then the question "Would you want to be able to access an API with
raw test data?" again put intent into the "no" answer.  The answers
should have been
  (1) yes
  (2) no

If you wanted to explore further, a second question would be:
"Do I want to design my own CI tools that access the raw test
data via an API?".
