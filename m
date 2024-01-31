Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE880BEC
	for <workflows@vger.kernel.org>; Wed, 31 Jan 2024 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706709312; cv=none; b=qBsLXnh3a0wY0b+bZsvpSXtobJL6Kk2pKmTcFBll3cxL4LCRCZuTLoUQpNpZU+8Yndrmkui+x0DL6eXYrKC1bRDBSKbJJvcnAcoKxKS5VzNUt1wr3EzvW3J/87/cPWVfzii6zwlIUeJG5Mc524rh0FdRIIA5MQ03r2VdwVwJeiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706709312; c=relaxed/simple;
	bh=2yaCnDKq0712Qh8a06J2vzYCV+H6rMFpxYGO33ZtKik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TddMdl1vrUtIQbDGLeP6CtN8g1kCkUQLvcoJjrjmfT4HedMsqlnz3cag45LxyAIdVOfGe1ORPss9olFQj9ZdbOGGSwKyg5fXuiZKyJfbJRT2GVGBpmVg9ZXdILaVaW12bkPH/67DkcUjaRXWjywxAjx3e9HYvxNghkb5iLHTPbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LmQswoNt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LmQswoNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706709308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ui8Ga7Cs9sNQw1EgI7uvDxrW0t4sq0StM9hyxQjQuMo=;
	b=LmQswoNtsTmqc5NZ5C3N26oiLw0n1XEvHjUYeUB/GMXrOhtkZkXgbA1HiZBGD0JDlrr5Q8
	5SllqPvu4QaSs9xxEDpgBGgDirh6YNplcu+VLeoiCjsx3s9AzQWH4yl+pOBJ2+ooHot4zo
	+IubNIrmUQJEBK2QEIB7vYR+MND24JI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-51ix8juZMxC_LBzJAYsdBw-1; Wed, 31 Jan 2024 08:55:04 -0500
X-MC-Unique: 51ix8juZMxC_LBzJAYsdBw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33b0256dd6bso368156f8f.2
        for <workflows@vger.kernel.org>; Wed, 31 Jan 2024 05:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706709303; x=1707314103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui8Ga7Cs9sNQw1EgI7uvDxrW0t4sq0StM9hyxQjQuMo=;
        b=IqIYOwaeImepS+xpQQqt/tZZD/LYHEKZmSJqgZG8Rvw8BYa+NBQf7dzl269pNIdBYh
         flxGWnAQIpLisIH9yaYM66mk+0N/dTHnWZ6hQzIMW9CEsGvVq4Vulaf+WRli4Aw36OJL
         23LmZ4j1ZgzGELMymBd/la9jC0stWnGmCKdYUBVZMnbNRdn5r97fJd3KrwvXEFcVzNob
         O3r38gTczOH7ctcuXpX/lDAEJyvEwLRyJD71UWaNsRS56rNbwq0gTfHbFtJMnLdOpsDf
         Lyp4BUX8ylWYzq4nV+k3eSPSznef4PICQC3Bwni3k12prMLzNEZ/zsKvWt7zOTIBzfAT
         opOw==
X-Gm-Message-State: AOJu0Yzc6+81u+2ne/KXop3H/q+4a23g6LurrhnDzxHSW+JtPq35kJ3x
	3Ur61Var/I4HnF2X0r/Vt2uXFHCaxtwJCzS7HHuCzAwWnsQfrQOyVBwGQ5t1UoeFo1f3A2AS8qv
	UxfhKC6qZMJROR3YSYAbL94ZhCLf8SFgLTVWPib17FFQjxAWpWLDCkKHPvw==
X-Received: by 2002:a5d:6204:0:b0:33a:e72c:c252 with SMTP id y4-20020a5d6204000000b0033ae72cc252mr1248151wru.52.1706709303335;
        Wed, 31 Jan 2024 05:55:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF0ZaZ2+VFi5PGhj8WaiXpjUefSFNS3ytagKmk1koTDenh/6Ywn8HmCZ4+95coNSTRyHqxog==
X-Received: by 2002:a5d:6204:0:b0:33a:e72c:c252 with SMTP id y4-20020a5d6204000000b0033ae72cc252mr1248138wru.52.1706709303015;
        Wed, 31 Jan 2024 05:55:03 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id i16-20020a5d4390000000b0033af37102ddsm6858131wrq.1.2024.01.31.05.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 05:55:02 -0800 (PST)
Message-ID: <f7774c3a-792b-457c-acd3-11f8aa368d6c@redhat.com>
Date: Wed, 31 Jan 2024 15:55:00 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/10] get_maintainer: Survive querying missing
 files
To: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-2-Nikolai.Kondrashov@redhat.com>
 <9fe310a9d4486ecf57669bf7b44a49c1788452c1.camel@perches.com>
Content-Language: en-US
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <9fe310a9d4486ecf57669bf7b44a49c1788452c1.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 20:55, Joe Perches wrote:
> On Tue, 2023-12-05 at 20:02 +0200, Nikolai Kondrashov wrote:
>> Do not die, but only warn when scripts/get_maintainer.pl is asked to
>> retrieve information about a missing file.
>>
>> This allows scripts/checkpatch.pl to query MAINTAINERS while processing
>> patches which are removing files.
> 
> Why is this useful?
> 
> Give a for-instance example please.

Does the example I provided make sense, Joe?

Would my solution be adequate, or would you like to have another?

Thank you.
Nick

