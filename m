Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5708122759C;
	Fri, 10 Apr 2026 00:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780321; cv=none; b=H680kIMCXAKF3KXpFUOwInmbTS+dM7fx4mkHlmDuO0z7VdGeRSwbQJxUAUEWe2CFZ9uqjskKEaWq40ZJS7HJ/owcli7V8tHImYzKUAE+pHRmSo/ozDlg26ph5r5jNtd1qOqFDxWMEfPxdXw8XFcKSJFX49A7RXw55CxaHSH5BYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780321; c=relaxed/simple;
	bh=YnZsdan2sCk27ohr3umm6f0bl5JJ05TowFYUiiilC+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HuE1YEc75/kq+3PL6hdKJyd5GOTW0EWGX2rkrRf2k5PGhte05zthJtDcLiIJVKN0uqmoCOl7Ip/a4uDRpKKVht/O1a5AaWOXyegbdG/HyTb7b9uNNTU8f8+W6cgnY2JWChAOY5pmfje7pNaili6ocgjNqSV1Dmoz7vS9L/O4sGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kzGfoUtb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kzGfoUtb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Q5S9pQYXXA2rICRxhUUfxrhNFn7H6PPfpMBY2wtBghE=; b=kzGfoUtb6itMfxHfpgHOhOnWOI
	nw1RYDLG0IGZ/r2EPAx+44bTxKjdnkOBvllPlLOywH+ypv74v4AvF3JciRsAFRueL48QSfgfWzVfp
	ibr8gHELIaq9t3uiZCqfg45OI5LjZrzKsluS79bcf+6vAc+OMKcYtrejmmKNT/G5pZixrZ4WmBzI0
	SXnnJtIpIUCGwpaovrmwoQkuEJpTVNADDA9WdcBgurmdLbA0F6gfqYDvS5AcssFIPJJb0dXGUiMG2
	2Qj4jgsjv8EGHTyb0F+Htcy4AjnEaaJT3voK2sK81nk9HIIQLxawQTdrdbnkunj0khJFWCMD5sNlk
	ChvMRrrw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAza4-0000000BMd9-01df;
	Fri, 10 Apr 2026 00:18:40 +0000
Message-ID: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
Date: Thu, 9 Apr 2026 17:18:39 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: maintainer profiles
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Is there supposed to be a difference (or distinction) in the contents of

Documentation/process/maintainer-handbooks.rst
and
Documentation/maintainer/maintainer-entry-profile.rst
?

Can they be combined into one location?

-- 
~Randy

