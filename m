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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119FEC433DF
	for <workflows@archiver.kernel.org>; Mon, 13 Jul 2020 18:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB3882067D
	for <workflows@archiver.kernel.org>; Mon, 13 Jul 2020 18:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTaiB41U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730109AbgGMSNt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Jul 2020 14:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729687AbgGMSNt (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Jul 2020 14:13:49 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B0AC061755
        for <workflows@vger.kernel.org>; Mon, 13 Jul 2020 11:13:49 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c139so13134540qkg.12
        for <workflows@vger.kernel.org>; Mon, 13 Jul 2020 11:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KXd1DyftAoIeiBil6KWAd0dHSkR64jGVakQ4eCpvLm0=;
        b=hTaiB41U4ZqrUwgEo/PIjTV6UrnslanEQfBRuA3/mSnT6SUJ4gd4NA7Rd74K3tFPNh
         7f3eh/UmgaDtHUFJj/kzHk40C3fm5kMkQVNmwte1UMoWuWmmGP1uPfxI33lHC0bD1hrb
         cEBmIVtawmHO+qLT04tQTuWiKMP/Qffr3hstJvkUQdVrqIxa5cF6RYH7bPKzPUPrBFtc
         ePpULo+rFfNkeyhzjuejor7AOX7DlyqYOfL4jtjRNJKWRGnhcHOgh2+3UtYb40scVicl
         mV1NGQ9vDYaVYHrbjIikdYGCxksBIN2YSIUun81PYkNMRG4Od40qf++HWSQ0Vi91X7As
         thkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KXd1DyftAoIeiBil6KWAd0dHSkR64jGVakQ4eCpvLm0=;
        b=COdiCy1BLJorZLzZ62/6eMO0lKkRZazKRDnGLE/vx0EeoXwledvE7a5AomdTkQarr3
         sCfW7dm8JeB3zgaNark3lnN8zlaiNK6xVbSU01LWwvnhVq5B5+YIay2pEO4P7NueytSC
         CA4rvBlCzVyd9voXqUTCIPrdlfJeWUilWCAKqExeZoajgCdfGHS4RJJgwGvj8BLiScft
         FCIEsNJE2xu8CH5zsaCZMv63cyMy2swJSS1AQL//GYsSYMmEe0pO43MharhcCEhzjNx5
         RSP7FqWw50E50ZjD5zyjDAejB8JkVxW7OIkGII7ggLqi85mm4Vi0fL7x+ua9osuopqHC
         CTEQ==
X-Gm-Message-State: AOAM530EFDAPh0dcJ3ebik+XVNYIhYiLQZRpLbGxvLGsSC9uwU+TfQeV
        xm1926i5RCbqj5/5TmPnwd8=
X-Google-Smtp-Source: ABdhPJyV7stZ89yVxUs+Z8kwTMNsDOmLpv/DaQr9bpxTTI8mdJK1UOGs4lyTz4FTiWa2oLSxwjV2WQ==
X-Received: by 2002:a37:8384:: with SMTP id f126mr861742qkd.471.1594664028355;
        Mon, 13 Jul 2020 11:13:48 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id t57sm20197975qtc.91.2020.07.13.11.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 11:13:47 -0700 (PDT)
Subject: Re: KernelCI Community Survey
From:   Frank Rowand <frowand.list@gmail.com>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        kernelci@groups.io, automated-testing@lists.yoctoproject.org,
        kernel-build-reports@lists.linaro.org, workflows@vger.kernel.org
References: <4e70209b-e637-abdf-d72a-7cb978956f9d@collabora.com>
 <d03548cc-86ee-4922-7819-9a22acc055ee@collabora.com>
 <c19726e0-0483-c718-2d33-e7ac9c88cb19@collabora.com>
 <f464f853-246b-2eac-03be-91385e5457e3@gmail.com>
Message-ID: <48ebf569-3113-2497-04be-54de5318b8ea@gmail.com>
Date:   Mon, 13 Jul 2020 13:13:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f464f853-246b-2eac-03be-91385e5457e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 2020-07-13 12:49, Frank Rowand wrote:
> On 2020-07-09 17:32, Guillaume Tucker wrote:
>> On 11/06/2020 11:11, Guillaume Tucker wrote:
>>> + workflows
>>>
>>> On 02/06/2020 22:22, Guillaume Tucker wrote:
>>>> As the KernelCI project keeps growing, we need to know a bit
>>>> better what the Linux kernel community needs in terms of
>>>> automated testing.  We would really appreciate if you could
>>>> please spare one minute to fill this survey form:
>>>
>>> Sending out a big Thank You for all the replies we have received
>>> already, your input is proving to be highly valuable.  We thought
>>> it would also be relevant to share this on the workflows mailing
>>> list and reach a slightly broader audience while the survey is
>>> still open.
>>>
>>>>   https://forms.gle/Y5iuyLXgQr2y3SrF6
>>>
>>> Please feel free to fill the form if you haven't done so already
>>> and share the link above with others you think might be
>>> interested.
>>
>> Thanks again everyone who has responded to the survey.  Here's
>> the detailed report which also includes a spreadsheet with the
>> full results (minus any personal information):
>>
>>   https://foundation.kernelci.org/blog/2020/07/09/kernelci-community-survey-report/
>>
>> Please also note that we've decided to re-open the form until the
>> end of August, in case some of you missed the opportunity to
>> respond before.  The link is the same as in my previous email:
>>
>>   https://forms.gle/Y5iuyLXgQr2y3SrF6
>>
>> Best wishes,
>> Guillaume
>>
> 
> 
> Some feedback from my experience answering the survey today.

I did not want to influence my survey answers by reading the report
before answering.

Now that I have read the report, some feedback on the report.

For "Response Time", the report mentions that bisections "sometimes
take a few hours to complete", and also mentioned "having quick
results is also needed for some use-cases".  One possible way to
provide quick results _and_ perform a longer bisect would be to
send a preliminary "error detected" report email, with the email
noting that the bisection has not been completed yet, and that a
fuller error report will be provided once the bisection completes.

The quick warning would both make me more cautious about accepting
a patch too quickly and encourage me to look more carefully at the
patch if I had already reviewed it and not found any issues.

The report seems to report "Automated Testing" differently than I
interpreted the question.  I answered "no" to whether I use any
CI test system because I don't directly interact with the automated
CI test systems (I just receive error messages when my patches
have an error, and also see error reports for other people's
patches when those emails are to a mail list).  However, I do my
own automated testing when I receive patches.  So my answer was
not properly accounted for in the first sentence of the "Automated
Testing" section of the report that says "It seems that maintainers
are doing more automated testing and find more bugs than developers."
(I answered the survey as a maintainer.  It probably would be useful
to answer the survey once for each of my roles - so once as a developer
and once as a maintainer.)

Another comment on the second paragraph of "Automated Testing", one
issue mentioned is that "if issues that regularly take that time to
get discovered it's more likely to be due to the lack of early test
coverage ...".  In my experience, bugs found after a delay are often
due to running the tests on different boards, different architectures,
with different configurations, etc.  I'm not sure if that is what was
meant by "coverage" in the sentence I quoted.

-Frank

> 
> Question "Would a web-based dashboard fit well within your workflow?"
> had two answers.  The answers to choose from made assumptions about
> why one would choose "yes" or "no".  The second answer is "No thanks,
> I only want to work with emails and command line tools."  The second
> answer does not allow me say that I have a preference for emails
> and command line tools, but I find a web based interface to also
> provide value.
> 
> It would be better to split the original question into two questions:
>   (1) web-based dashboard useful? (yes/no)
>   (2) emails and command line tools useful? (yes/no)
> And it would probably be even better to split (2) into (2) emails,
> and (3) command line tools.
> 
> I wanted to answer yes to each of them, but if only one was available
> then I had a preference, which is what my answer was based on.
> 
> Then the question "Would you want to be able to access an API with
> raw test data?" again put intent into the "no" answer.  The answers
> should have been
>   (1) yes
>   (2) no
> 
> If you wanted to explore further, a second question would be:
> "Do I want to design my own CI tools that access the raw test
> data via an API?".
> 

