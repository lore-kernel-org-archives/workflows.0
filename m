Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB724C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 17:20:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AFE32089F
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570814420;
	bh=gcq68lpyBnrFm6wsoRxthFwmkz/Myj73uwbU+XXoLO0=;
	h=Subject:To:References:From:Date:In-Reply-To:List-ID:From;
	b=LglZNWWWLCR5ha36Tq8SJ/X5QXg0Uur4xK0zq1rld2bwH4WJIgE3dcyzMJ5a70l2X
	 3zWKW5deTBneBlgRh0geSn6NZ9i02omWTfTI4RMWv4N7759NLxw8AV5DeSs6KnT55z
	 S3+XXxzEzBiTo14ISdp7cwcOS90O503gYtA47NQY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbfJKRUU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 13:20:20 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41303 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbfJKRUU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 13:20:20 -0400
Received: by mail-io1-f67.google.com with SMTP id n26so23058447ioj.8
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Cx2qoB6yOzxQfmfjfAkr9/ExuKZidtzQ4ImtxQyEAg4=;
        b=aTBBJFG1Us4P8SB0d1OfkqW7pJSdhSBAMZUJF6sVXWhYEuuIqzEndlY+DZt5GoDARo
         ep7gtfHwzGe0yYpZySX9mWU+8o0eUqHOMMRCu/twt8Nk/GQFZFdzMbi92lcJtQ1csEpA
         fTuNQn34zvBIbDLE3ti/7o+Pf2XlQuRf2ddN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cx2qoB6yOzxQfmfjfAkr9/ExuKZidtzQ4ImtxQyEAg4=;
        b=FU6rtV2dgQLlUZgqKL2wtEqnRAOmrFtnZ+cQaHwup3JHs/Mle6V5UdA3GYV1gu1F9l
         dHp/DWPLW88wGFv9frRCqm2odBKoYxsUs5T8lW6q0h355yVrXKVgBcqcjmYkN9bCLemw
         cp5dlDnoVvu4SY1Inxl5y3lW3svJl7k8kXpFqbE+3e48PpGkxTqfhy0EsupON5ubjfYo
         fIO6/8BfiBPpnwt46oV3j35DEQjNBD0kH4ZzcJX95KglQacMoGZ5x8ptjAjrN2fWvjlw
         TifuSnO1piowVgycdHYgLcaFKg/qj0zBDsXRy9ZRbuo4FAY6Mh41h0awHXbAeI/8eHxp
         UTLQ==
X-Gm-Message-State: APjAAAUy8+YWGpW9sQaDCTsHL+YGyLl+ANv0US4EVKlhv6+YOB7WqaKJ
        lLfTfHqWxnTcnPBS7VIkUji9sg==
X-Google-Smtp-Source: APXvYqyEHzGL/bGt6X7WsZvrsO2CIJA6lzd5KjnHoGZ1RG/Pljue9N2puKKpo6eW2gQ7DcAV2NZNPQ==
X-Received: by 2002:a02:a15b:: with SMTP id m27mr19123864jah.59.1570814418629;
        Fri, 11 Oct 2019 10:20:18 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 128sm12610542iox.35.2019.10.11.10.20.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 10:20:18 -0700 (PDT)
Subject: Re: RFE: use patchwork to submit a patch
To:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
Date:   Fri, 11 Oct 2019 11:20:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011085702.GB1075470@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 10/11/19 2:57 AM, Greg KH wrote:
> On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:
>> Hi, all:
>>
>> I would like to propose a new (large) feature to patchwork with the goal to
>> make the process of submitting a patch easier for newbies and people
>> generally less familiar with patch-based development. This was discussed
>> previously on the workflows list:
>> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
>>
>> How I envision this would work:
>>
>> - user creates an account (which requires a mail confirmation) >> - they choose a "submit patch" option from the menu
>> - the patch submission screen has a succession of screens:
>>
>>   1. a screen with a single field allowing a user to paste a URL to     their
>> fork of the git repository. Once submitted, patchwork does a     "git
>> ls-remote" to attempt to get a list of refs and to verify that     this is
>> indeed a valid git repository
> 
> s/valid git repository/valid git repository based on the kernel git tree/
> 
> Otherwise you might be sending out lots of emails for other projects :)
> 
>>
>>   2. next screen asks the user to select the ref to work from using the
>> list obtained from the remote. Once submitted, patchwork performs a     `git
>> clone --reference` to clone the repository locally using a     local fork of
>> the same repo to minimize object transfer. This part     requires that:
>>        a. patchwork project is configured with a path to a local fork,
>> if this feature is enabled for a project
>>        b. that fork is kept current via some mechanism outside of
>> patchwork (e.g. with grokmirror)
>>        c. there is some sanity-checking during the clone process to
>> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
>> -- other suggestions welcome)
>>
>>   3. next screen asks the user to pick a starting commit from the log.
>> Once submitted, patchwork generates the patch from the commit     provided
>> to the tip of the branch selected by the user earlier,
>>      using git format-patch.
>>
>>   4. next screen asks the user to review the patch to make sure this is
>> what they want to submit. Once confirmed, patchwork performs two
>> admin-defined optional hooks:
>>
>>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
>>        b. a sanity check hook (e.g. checkpatch.pl)
> 
> I will note that many "first patch" submissions are checkpatch.pl
> cleanups for staging.  When doing that, I require that they do "one
> logical change per patch", which means that many of the individual
> patches themselves will not be checkpatch.pl clean, because many lines
> have multiple issues with them (tabs, spaces, format, length, etc.)
> 
> So other than that minor thing, sounds interesting.  It's hard to
> determine just how difficult the whole "set up git and send a patch out"
> process is for people these days given the _huge_ numbers of new
> contributions we keep getting, and the numerous good tutorials we have
> created that spell out exactly how to do this.
> 
> So you might be "solving" a problem that we don't really have.  It's
> hard to tell :(
> 

I agree with this. I don't think this a problem that is worth solving.
When a new developer wants to send a patch, they don't need to create
any accounts. They setup their email client and send patch.

We have several resources that walk them through setting up email
clients and sending patches. checkpatch.pl can be automated with
git hooks.

>> I know this is a pretty big RFE, and I would like to hear your thoughts
>> about this. If there is general agreement that this is doable/good idea, I
>> may be able to come up with funding for this development as part of the
>> overall tooling improvement proposal.
> 
> The workflow seems sane, and matches what most people do today, with the
> exception that it "solves" the git send-email issue, right?  Is that our
> biggest barrier?
> 
> I would recommend interviewing some of the recent kernel mentor project
> and outreachy applicants first, to try to determine exactly what their
> problems, if any, were with our development process.  If they say that
> this type of tool/workflow would have saved them hours of time and
> energy, then that's a great indication that we should try to do this.
> 

I would say considering the number of applicants to mentorship program
and new developers it will be lot overhead to require them to create
patchwork accounts, and it might even be hard overtime. A lot of them
start out and drop out in the middle. With the current setup, nothing
to cleanup.

Setting up email clients and git hooks is one time task. It is the
easiest of the learning curve for many new developers. New developers
struggle with getting the change logs right, coding styles right, and
responding to review comments and acting on them.

These aren't something that can be automated and they just have to
learn through experience of sending patches.

My opinion based on contact with new developers as well running the
mentorship program, I would sat this isn't something that needs
solving.

thanks,
-- Shuah
