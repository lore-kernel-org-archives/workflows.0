Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D741C197A0
	for <workflows@archiver.kernel.org>; Thu, 16 Nov 2023 12:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345158AbjKPMOg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Nov 2023 07:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345138AbjKPMOf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Nov 2023 07:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5472E9C
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 04:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700136871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8bNUOH0W+hzau0QOi98ae0r3jNAzrQ9c27bIiiL1MLQ=;
        b=JV+s4vKSEIy3BjOQbpsJtKijnMJGb3n7xdiAOoK4EIgikUIiKMmaeneEZWVmNkCnq/8QKn
        MlvzobvdjVpJ6urXHZa5DiFMolKNA/PY7hvJ3xRwtqDGz+3r73VwBa2gp25I3iDz5Pqn/b
        XtqcWy24i9ofmmBXrV3XdNJ6zqhYQh0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-vDIscZTiPQ6VZoUDeLS5Xg-1; Thu, 16 Nov 2023 07:14:30 -0500
X-MC-Unique: vDIscZTiPQ6VZoUDeLS5Xg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-779f645c74cso72921885a.0
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 04:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136869; x=1700741669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bNUOH0W+hzau0QOi98ae0r3jNAzrQ9c27bIiiL1MLQ=;
        b=BZUYAKeDDo095l2XJ72Tc6F6Ei/gKfOhzwXb2EFFmr9ijXmgbuzq12leGGmL1+aza/
         xsfSZaDVLKQof23jKsVhEUgODTZZYQ35jsnkl91hCXotZpHQb+4V1VlNceXS6VI9NFjk
         xb4E0okHXxtdc2du/ZU6Vw6Wa0WtOTul9qacXQ43ORMyGw6uqAR07XLoe34ZlNlF077H
         d1QrtD6ArrQLjisQbCvnaKS+mI1eIIAGfaQRqJ/acA8cqKmtTTE78q1aGDBMliRkyoWX
         ouf7zpQiwPGWdsfm9JuOqkB+xE3bn1l7Lnul3ooSnTK25eNQmcA+Xb4OF5WoYxA5DRzH
         Ko0Q==
X-Gm-Message-State: AOJu0Yx2NDW8rPK3VUZYJkzkOVIu17O4vag+5TfqkZ5YX+pb3FdQZ6yE
        wIWGf5pgi5VFTAdYuyg+Bf3O1BVCGtUEm8VoiEOXXuJ37ZuDGOXuGr/gYb/daXhydQI0w53p1+U
        n1Zgu0JgihWA2fnk27VJdqdC7JNfAAhY=
X-Received: by 2002:ac8:7f4c:0:b0:41c:dd22:e7bf with SMTP id g12-20020ac87f4c000000b0041cdd22e7bfmr10072034qtk.42.1700136868939;
        Thu, 16 Nov 2023 04:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPGczeFtCmKIQDf7fheNsirZABfTHQecH6L89Gj9lo6GuRXElt/m+iwntGdSDoB0dFD/x7OA==
X-Received: by 2002:ac8:7f4c:0:b0:41c:dd22:e7bf with SMTP id g12-20020ac87f4c000000b0041cdd22e7bfmr10072017qtk.42.1700136868716;
        Thu, 16 Nov 2023 04:14:28 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id g9-20020ac84dc9000000b0041cb787ff41sm4251329qtw.67.2023.11.16.04.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 04:14:28 -0800 (PST)
Message-ID: <13fe4866-0522-4690-a060-160fdab9f54b@redhat.com>
Date:   Thu, 16 Nov 2023 14:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Content-Language: en-US
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <20231115-charcoal-sloth-of-wizardry-5a75fa@nitro>
From:   Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <20231115-charcoal-sloth-of-wizardry-5a75fa@nitro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/15/23 22:38, Konstantin Ryabitsev wrote:
> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
>> Introduce a new tag, 'Tested-with:', documented in the
>> Documentation/process/submitting-patches.rst file. The tag is expected
>> to reference the documented test suites, similarly to the 'V:' field,
>> and to certify that the submitter executed the test suite on the change,
>> and that it passed.
> 
> I'm not sure it should be a tag that stays all the way through git commit.
> How about making it a cover letter/first patch footer?
> 
> tested-with: <suite>

Yes, that would be better indeed. However, checkpatch.pl doesn't process cover 
letters, and so we would have no automated way to advertise and nudge people 
towards testing.

Nick

P.S. Git forges do that for you by nature of actually running the tests 
themselves, automatically. *Ducks*

