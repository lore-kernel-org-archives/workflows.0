Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5C12D1F1;
	Thu,  2 Apr 2026 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775155376; cv=none; b=G61abucDtDN7EgIHWwx3Lb9YYKyY0Mvg9ONzXDOrJ8RV8TNEjJBGr/Rj56EA+vk2PUb0HmYNYWijkrNOOP8k0+UYEwhfoh/mkDWrX/B1WcnEbTYMocDuqoA9d+8vzU7IS8P9b60nIdU7JZSuDpQf5/LC4tZ6fdQn5U91qEHNUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775155376; c=relaxed/simple;
	bh=Wn+bGi7YTfexnpFsAJ0DYaJ+cBex/PNg+0LdnSLKUjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mtx4G1EHRC1S20cgoJH9Kc8IbF2sJwU/nAFr6u/kJHbr+d8D7EF57gG1PPqIclRm6eKVWOZFPf6MPxNT0jeVwHcsYeIRkP9x6U5rKdz6iMKhDrjvQ0PZBceqnzKh1l1xbWLkyCKyZfBX0dimJW+ebYWDrjVwDYqalhKoVSC4cu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VHleWNH2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VHleWNH2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PR5Zmpij/gqKdonMotRWBkZ0VFF58Txh324HPa3o77U=; b=VHleWNH2FEYDhfWB91/ALXGSD2
	tEaT0Gmj5vsWZSiuONCyOO4XuR47JRW0b679FhxYQ7akM7TtQD39fDjMeMF2g5vl/Ctu2kpeqe6Cc
	cm+PSBihzUphwC2bYqydD9pKLpGbJWKvjLLb0lBIskzeUHwyYAQKTS2ngk26ejLP4K9LXpXNIYavv
	v5m0qja6jkPdADx0S4ceWoHZzpBzHo8qr6nO8hiS4xOX8EE+VcIepuayOAPVtBrHAJ5eQlXqRnpKg
	/RCZYgzehU5rLEg0czlZgHh7Zum+Q3lvDigaNjutopFqzEC2oPe3KRwrjWKbWvDJeBWEYbG8+TEIk
	iiOne51Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8N0G-00000000gKL-1VBV;
	Thu, 02 Apr 2026 18:42:52 +0000
Message-ID: <e9f0bbe9-fbff-45c8-af99-4c66982bd2cd@infradead.org>
Date: Thu, 2 Apr 2026 11:42:51 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Documentation: explain how to find maintainers
 addresses for security reports
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: edumazet@google.com, Jonathan Corbet <corbet@lwn.net>,
 skhan@linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402182655.8636-1-w@1wt.eu> <20260402182655.8636-3-w@1wt.eu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260402182655.8636-3-w@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/26 11:26 AM, Willy Tarreau wrote:
> These days, 80% of the work done by the security team consists in
> locating the affected subsystem in a report, running get_maintainers on
> it, forwarding the report to these persons and responding to the reporter
> with them in Cc. This is a huge and unneeded overhead that we must try to
> lower for a better overall efficiency. This patch adds a complete section
> explaining how to figure the list of recipients to send the report to.
> 
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Greg KH <greg@kroah.com>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 76 ++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index da7937fd59df..6937fa9fba5a 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst


>  Markdown, HTML and RST formatted reports are particularly frowned upon since
>  they're quite hard to read for humans and encourage to use dedicated viewers,
>  sometimes online, which by definition is not acceptable for a confidential
> -security report.
> +security report. Note that some mailers tend to mangle formatting of plain
> +text by default, please consult :doc:`the email client howto
> +<../process/email-clients>` for more info.

Just use the file name and let automarkup do its job:

   text by default; please consult Documentation/process/email-clients.rst
   for more information.

It's also more convenient for text readers that way.

>  
>  Disclosure and embargoed information
>  ------------------------------------

-- 
~Randy

